import SwiftUI
import HealthKit

class HealthKitService {
    let hkStore = HKHealthStore()
    private let stepType = HKQuantityType(.stepCount)
    private let energyBurned = HKQuantityType(.activeEnergyBurned)
    private let moveTime = HKQuantityType(.appleMoveTime)
    private let standTime = HKQuantityType(.appleStandTime)
    
    var queries: [HKQuery] = []
    
    func requestHKAuth(completion: @escaping (Bool) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            print("HealthKit 사용 불가능")
            return
        }
        
        hkStore.requestAuthorization(toShare: [], read: [stepType, energyBurned, moveTime, standTime]) { success, error in
            if success {
                print("권한 허용 완료")
                completion(true)
            } else {
                print("권한 요청 거부")
                completion(false)
            }
        }
    }
    
    func startObserve() {
        for type in [stepType, energyBurned, moveTime, standTime] {
            startObserveQuries(type: type)
        }
    }
    
    func startObserveQuries(type: HKQuantityType) {
        let query = HKObserverQuery(sampleType: type, predicate: nil) { [weak self] _, _, error in
            guard let self = self, error == nil else {
                print("ObserverQuery 오류 발생: \(error?.localizedDescription ?? "알 수 없는 오류")")
                return
            }
            self.fetchLatestData(for: type)
        }
        
        hkStore.execute(query)
        queries.append(query)
        hkStore.enableBackgroundDelivery(for: type, frequency: .immediate) { success, error in
            if success {
                print("\(type.identifier) 실시간 업데이트 등록됨.")
            } else {
                print("백그라운드 전달 설정 오류: \(error?.localizedDescription ?? "알 수 없는 오류")")
            }
        }
    }
    
    private func fetchLatestData(for sampleType: HKQuantityType) {
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)

        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)

        let query = HKStatisticsQuery(quantityType: sampleType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                print("\(sampleType.identifier) 데이터를 가져오는 데 실패: \(error?.localizedDescription ?? "알 수 없는 오류")")
                return
            }

            // ✅ 데이터 유형에 따른 단위 지정
            let unit: HKUnit
            switch sampleType {
            case HKQuantityType(.stepCount):
                unit = HKUnit.count()   // 걸음 수는 'count'
            case HKQuantityType(.activeEnergyBurned):
                unit = HKUnit.kilocalorie()   // 소모한 에너지는 'kcal'
            case HKQuantityType(.appleMoveTime),
                HKQuantityType(.appleStandTime):
                unit = HKUnit.minute()  // MoveTime, StandTime은 '분'
            default:
                print("⚠️ 지원하지 않는 데이터 타입: \(sampleType.identifier)")
                return
            }

            let value = sum.doubleValue(for: unit)  // ✅ 단위 적용하여 값 가져오기

            DispatchQueue.main.async {
                print("\(sampleType.identifier): \(value)")
                self.handleUpdatedData(for: sampleType, value: value)
            }
        }

        hkStore.execute(query)
    }
    
    private func handleUpdatedData(for sampleType: HKQuantityType, value: Double) {
        print(sampleType, value)
//        switch sampleType {
//        case stepType:
//            print("👣 걸음 수 업데이트: \(value) 걸음")
//        case energyType:
//            print("🔥 소모한 에너지 업데이트: \(value) kcal")
//        case moveTimeType:
//            print("⏳ Move 시간 업데이트: \(value) 분")
//        case standTimeType:
//            print("🚶‍♂️ Stand 시간 업데이트: \(value) 시간")
//        default:
//            break
//        }
    }
}
