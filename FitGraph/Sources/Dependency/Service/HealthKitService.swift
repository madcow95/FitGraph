import SwiftUI
import HealthKit

final class HealthKitService {
    private let HKStore = HKHealthStore()
    
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
}
