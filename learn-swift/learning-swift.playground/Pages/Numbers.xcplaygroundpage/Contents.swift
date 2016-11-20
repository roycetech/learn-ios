func formatSet(weight: Float, reps: Int) -> String {
    var formatted = ""
    var pWeight = weight as Float
    
    if weight > 0 {
        if weight.truncatingRemainder(dividingBy: 1) == 0 {
            formatted = String(describing: Int(weight))
        } else {
            formatted = String(describing: weight)
        }
    }
    return "\(formatted)x\(reps)"
}

formatSet(weight: 0, reps: 12)
formatSet(weight: 100, reps: 12)
formatSet(weight: 102.5, reps: 12)


//'inout Float' is not convertible to 'Float'


100.0.truncatingRemainder(dividingBy: 1)
100.1.truncatingRemainder(dividingBy: 1)
100.0.divided(by: 1)
100.5.divided(by: 1)

0.0 > 0
