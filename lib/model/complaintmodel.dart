class Complaintmodel {
  final String name;
  final String mobile;
  final String problemType;
  final description;
 // final String timestamp;
  final String conditionl;


  Complaintmodel({

    required this.name,
    required this.mobile,
    required this.problemType,
    required this.description,
    //required this.timestamp,
    required this.conditionl

  });
  factory Complaintmodel.fromMap(Map<String, dynamic> map){

    return Complaintmodel(

        name: map['name']??'null',
        mobile: map['mobile']??'null',
        problemType : map['problemType']??'',
        description :map['problemDescription'],
      //  timestamp: map['timestamp'].toString()??'',
        conditionl: map['condition']??''



    );

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobile,
      'problemType': problemType,
      'problemDescription': description,
      //'timestamp': timestamp,
      'condition': conditionl,
    };
  }
}