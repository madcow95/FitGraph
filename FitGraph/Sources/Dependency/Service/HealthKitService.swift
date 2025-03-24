import SwiftUI
import HealthKit

final class HealthKitService {
    private let hkStore = HKHealthStore()
    let calendar: Calendar = {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(identifier: "Asia/Seoul")!
        return cal
    }()
    
    enum WorkoutType: CaseIterable {
        case sleep
        case workout
        case mindful
        case walking
        case noise
        case water
        case activeEnergyType
        case appleExerciseTime
        case appleStandTime
        
        var readType: HKObjectType {
            get {
                switch self {
                case .sleep:
                    return HKCategoryType(.sleepAnalysis)
                case .workout:
                    return HKCategoryType.workoutType()
                case .mindful:
                    return HKCategoryType(.mindfulSession)
                case .walking:
                    return HKQuantityType(.stepCount)
                case .noise:
                    return HKQuantityType(.environmentalAudioExposure)
                case .water:
                    return HKQuantityType(.dietaryWater)
                case .activeEnergyType:
                    return HKQuantityType(.activeEnergyBurned)
                case .appleExerciseTime:
                    return HKQuantityType(.appleExerciseTime)
                case .appleStandTime:
                    return HKQuantityType(.appleStandTime)
                }
            }
        }
        
        var writeType: HKSampleType {
            get {
                switch self {
                case .sleep:
                    return HKCategoryType(.sleepAnalysis)
                case .workout:
                    return HKCategoryType.workoutType()
                case .mindful:
                    return HKCategoryType(.mindfulSession)
                case .walking:
                    return HKQuantityType(.stepCount)
                case .noise:
                    return HKQuantityType(.environmentalAudioExposure)
                case .water:
                    return HKQuantityType(.dietaryWater)
                default:
                    return HKQuantityType(.activeEnergyBurned)
                }
            }
        }
    }
    
    func requestAuth() async {
        let readTypes: Set<HKObjectType> = Set(WorkoutType.allCases.map { $0.readType })
        let writeTypes: Set<HKSampleType> = Set(WorkoutType.allCases.map { $0.writeType })
        
        do {
            try await hkStore.requestAuthorization(toShare: writeTypes, read: readTypes)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchStepCount(date: Date) async -> Double {
        await withCheckedContinuation { continuation in
            let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
            let startOfDay = calendar.startOfDay(for: date)
            var interval = DateComponents()
            interval.day = 1
            
            let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: calendar.date(byAdding: .day, value: 1, to: startOfDay), options: .strictStartDate)

            let query = HKStatisticsCollectionQuery(
                quantityType: stepType,
                quantitySamplePredicate: predicate,
                options: .cumulativeSum,
                anchorDate: startOfDay,
                intervalComponents: interval
            )
            
            query.initialResultsHandler = { _, result, _ in
                var totalSteps: Double = 0
                result?.enumerateStatistics(from: startOfDay, to: self.calendar.date(byAdding: .day, value: 1, to: startOfDay)!) { statistics, _ in
                    if let sum = statistics.sumQuantity() {
                        totalSteps += sum.doubleValue(for: HKUnit.count())
                    }
                }
                continuation.resume(returning: totalSteps)
            }
            
            HKHealthStore().execute(query)
        }
    }
    
    func fetchSleep(date: Date) async -> [HKCategorySample] {
        await withCheckedContinuation { continuation in
            let sleepType = HKCategoryType(.sleepAnalysis)
            
            let startDate = Calendar.current.date(byAdding: .day, value: -7, to: date)!
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: calendar.date(byAdding: .day, value: 1, to: startDate), options: .strictStartDate)
            
            let query = HKSampleQuery(
                sampleType: sleepType,
                predicate: predicate,
                limit: HKObjectQueryNoLimit,
                sortDescriptors: nil
            ) { _, samples, _ in
                let sleepSamples = samples as? [HKCategorySample] ?? []
                
                continuation.resume(returning: sleepSamples)
            }
            
            HKHealthStore().execute(query)
        }
    }
    
    func fetchCalorieConsumption(date: Date) async -> (Int, Int, Int) {
        await withCheckedContinuation { continuation in
            let calendar = Calendar.current
            let startOfDay = calendar.startOfDay(for: date)
            let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: Date(), options: .strictStartDate)
            
            let energyQuery = HKStatisticsQuery(quantityType: WorkoutType.activeEnergyType.readType as! HKQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
                let energy = result?.sumQuantity()?.doubleValue(for: HKUnit.kilocalorie()) ?? 0
                continuation.resume(returning: (Int(energy), 0, 0))
            }
            
            hkStore.execute(energyQuery)
        }
    }
    
    func fetchWorkoutTime(date: Date) async -> Int {
        await withCheckedContinuation { continuation in
            let calendar = Calendar.current
            let startOfDay = calendar.startOfDay(for: date)
            let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: Date(), options: .strictStartDate)
            
            let workoutTimeQuery = HKStatisticsQuery(quantityType: WorkoutType.workout.readType as! HKQuantityType, quantitySamplePredicate: predicate) { _, result, _ in
                let workoutTime = result?.sumQuantity()?.doubleValue(for: HKUnit.minute()) ?? 0
                
                continuation.resume(returning: Int(workoutTime))
            }
            
            hkStore.execute(workoutTimeQuery)
        }
    }
    
    func fetchStandTime(date: Date) async -> Int {
        await withCheckedContinuation { continuation in
            let calendar = Calendar.current
            let startOfDay = calendar.startOfDay(for: date)
            let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: Date(), options: .strictStartDate)
            
            let workoutTimeQuery = HKStatisticsQuery(quantityType: WorkoutType.appleStandTime.readType as! HKQuantityType, quantitySamplePredicate: predicate) { _, result, _ in
                let workoutTime = result?.sumQuantity()?.doubleValue(for: HKUnit.minute()) ?? 0
                
                continuation.resume(returning: Int(workoutTime))
            }
            
            hkStore.execute(workoutTimeQuery)
        }
    }
}
