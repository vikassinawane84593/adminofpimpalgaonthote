class Complaintmodel {
  final String id;
  final String name;
  final int mobnumber;
  final String related;
  final String date;
  final String time;
  final String conditionl;


  Complaintmodel({

    required this.id,
    required this.name,
    required this.mobnumber,
    required this.related,
    required this.date,
    required this.time,
    required this.conditionl

  });
  factory Complaintmodel.fromMap(Map<String, dynamic> map){

    return Complaintmodel(

        id: map['id'],
        name: map['name']??'null',
        mobnumber: map['mobnumber']??'null',
        related: map['related']??'null',
        date: map['Date']??'null',
        time: map['time']??'',
        conditionl: map['condotion']



    );

  }
}