class AnalyticsDataPoint {
  final DateTime timestamp;  
  final double value;        
  final String metric;       
  final String? unit;        

  const AnalyticsDataPoint({
    required this.timestamp,
    required this.value,
    required this.metric,
    this.unit,
  });
}
