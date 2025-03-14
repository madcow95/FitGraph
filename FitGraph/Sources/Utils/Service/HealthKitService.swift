import HealthKit

class HealthKitService {
    let hkStore = HKHealthStore()
    
    func requestHKAuth() {
        guard HKHealthStore.isHealthDataAvailable() else {
            print("HealthKit 사용 불가능")
            return
        }
        
        let stepType = HKQuantityType(.stepCount)
        
        hkStore.requestAuthorization(toShare: [], read: [stepType]) { success, error in
            if success {
                print("권한 허용 완료")
            } else {
                print("권한 요청 거부")
            }
        }
    }
}
