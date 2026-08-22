import 'package:adminpanelofpimpalgaonthtevilage/model/officers_model.dart';
import 'package:flutter/material.dart';

class OfficerCard extends StatelessWidget {

  final OfficerModel model;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const OfficerCard({
    super.key,
    required this.model,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [


            CircleAvatar(
              radius: 35,
              child: ClipOval(


                child: Image.network(
                  width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    model.imageUrl,
                  loadingBuilder: (context,child,loading){
                      if(loading==null){
                        return child;
                      }

                      return CircularProgressIndicator();
                  },

                ),
              ),
            ),

            const SizedBox(width: 15),


            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    model.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    model.post,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    model.mobile,
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [

                      ElevatedButton.icon(
                        onPressed: onEdit,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5)
                          )
                        ),

                        icon: const Icon(
                          Icons.edit, size: 18,color: Colors.black,),


                        label:  Text(
                            "Edit",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),

                      const SizedBox(width: 10),

                      ElevatedButton.icon(
                        onPressed: onDelete,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5)
                          )
                        ),


                        icon: const Icon(Icons.delete, size: 18,color: Colors.black,),


                        label:  Text(
                            "Delete",
                          style:Theme.of(context).textTheme.titleMedium
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}