import 'package:flutter/material.dart';

class OfficerCard extends StatelessWidget {
  final String name;
  final String position;
  final String phone;
  final String imageUrl;

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const OfficerCard({
    super.key,
    required this.name,
    required this.position,
    required this.phone,
    required this.imageUrl,
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

            /// Officer Image
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(imageUrl),
            ),

            const SizedBox(width: 15),

            /// Officer Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    position,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    phone,
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