import SwiftUI
import HealthKit

final class HealthKitService {
    private let HKStore = HKHealthStore()
    let calendar: Calendar = {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(identifier: "Asia/Seoul")!
        return cal
    }()
    
    func requestAuth(completion: @escaping (Bool) -> Void) async {
        let sleep = HKCategoryType(.sleepAnalysis)
        let workout = HKCategoryType.workoutType()
        let mindful = HKCategoryType(.mindfulSession)
        let walking = HKQuantityType(.stepCount)
        let noise = HKQuantityType(.environmentalAudioExposure)
        let water = HKQuantityType(.dietaryWater)
        let readTypes: Set<HKObjectType> = [
            sleep,
            workout,
            mindful,
            walking,
            noise,
            water
        ]
        let writeTypes: Set<HKSampleType> = [
            sleep,
            workout,
            mindful,
            walking,
            noise,
            water
        ]
        
        do {
            try await HKStore.requestAuthorization(toShare: writeTypes, read: readTypes)
            completion(true)
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
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: date)
            
            let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, samples, _ in
                let sleepSamples = samples as? [HKCategorySample] ?? []
                
                continuation.resume(returning: sleepSamples)
            }
            
            HKHealthStore().execute(query)
        }
    }
}
