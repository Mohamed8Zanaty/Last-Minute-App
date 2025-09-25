import 'package:flutter/material.dart';
import '../../../models/WellnessOffer.dart';
final List<WellnessOffer> offers = [
  WellnessOffer(
    title: "Premium Gym Membership",
    subtitle: "FitLife Wellness Center",
    featured: true,
    icon: Icons.fitness_center,
    category: "Fitness",
    discount: "30% off",
    validUntil: "Valid until March 15",
    description: "Access to all equipment, group classes, and personal training sessions",
    oldPrice: "\$99",
    newPrice: "\$69",
  ),WellnessOffer(title: "Organic Skincare Bundle",
      subtitle: "NaturalGlow Essentials",
      featured: false,
      icon: Icons.auto_awesome_outlined,
      category: "Skincare",
      discount: "15% off",
      validUntil: "Valid until February 28",
      description: "Complete skincare routine with organic ingredients",
      oldPrice: "\$85",
      newPrice: "\$72"),
  WellnessOffer(title: "Weekly Organic Food Box",
      subtitle: "Fresh Farm Delivery",
      featured: false,
      icon: Icons.favorite_border,
      category: "Nutrition",
      discount: "",
      validUntil: "Launching March 1",
      description: "Fresh organic produce delivered to your doorstep weekly",
      oldPrice: "",
      newPrice: "Subscribe"),
  WellnessOffer(title: "Yoga & Meditation Package",
      subtitle: "Mindful Body Studio",
      featured: false,
      icon: Icons.favorite_border,
      category: "Wellness",
      discount: "20% off",
      validUntil: "Valid until March 31",
      description: "Monthly unlimited yoga Classes and guided meditation sessions",
      oldPrice: "\$120",
      newPrice: "\$96"),
  WellnessOffer(
    title: "Professional Spa Treatment",
    subtitle: "Luxury Wellness Spa",
    featured: true,
    icon: Icons.auto_awesome_outlined,
    category: "Skincare",
    discount: "25% off",
    validUntil: "Valid until February 20",
    description: "Full body massage and facial treatment package",
    oldPrice: "\$200",
    newPrice: "\$150",
  ),
  WellnessOffer(title: "Nutrition Consultation",
      subtitle: "MCertified Nutritionist",
      featured: false,
      icon: Icons.favorite_border,
      category: "Nutrition",
      discount: "40% off",
      validUntil: "Valid until March 10",
      description: "Personal nutrition plan and dietary guidance session",
      oldPrice: "\$100",
      newPrice: "\$60"),

];

class WellnessOffersScreen extends StatelessWidget{
  const WellnessOffersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFf8f7fc),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 22),
          child:  IconButton(onPressed: (){Navigator.pushReplacementNamed(context, '/home');}, icon: Icon(Icons.arrow_back,size: 20,color: Color(0xFF3730a2),)),

        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Wellness Offers",style: TextStyle(color: Color(0xFF3730a2),fontWeight: FontWeight.bold,fontSize: 25),),
                Text("Exclusive deals for your wellbeing",style: TextStyle(color: Color(0xFF3730a2),fontSize: 15),)
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.035,
            vertical: MediaQuery.sizeOf(context).height * 0.016,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MaterialButton(onPressed: (){},
                      color: Color(0XFF7e22cd),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color:  Color(0xFF7e22cd)),),child: Text("All Offers",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                    SizedBox(width: 10,),
                    MaterialButton(onPressed: (){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color:  Color(0xFF7e22cd)),),child: Text("Fitness",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(width: 10,),
                    MaterialButton(onPressed: (){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color:  Color(0xFF7e22cd)),),child: Text("Skincare",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(width: 10,),
                    MaterialButton(onPressed: (){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color:  Color(0xFF7e22cd)),),
                      child: Text("Nutrition",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
              SizedBox(height: 35,),
              ListView.separated(
                  itemCount: offers.length,
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics() ,
                  itemBuilder:  (context,index){final offer = offers[index];
                  return Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                        color: offer.featured?Color(0xFFa78bfa):Colors.white,
                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.0564),
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(-4, 4),
                          spreadRadius: 2,
                        )]
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.035,
                        vertical: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.sizeOf(context).width *0.16,
                                    height: MediaQuery.sizeOf(context).width *0.16,
                                    decoration: BoxDecoration(
                                      color:offer.featured?Color(0xFFa78bfa):Color(0xFFc7d2ff),// const Color(0xFFA68AFA),
                                      borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.04),
                                    ),
                                    child: Icon(
                                      offer.icon,
                                      size:MediaQuery.sizeOf(context).width*0.12,
                                      color: offer.featured?Colors.white:Color(0xFF7e22cd),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(offer.title,style: TextStyle(fontWeight: FontWeight.bold,color:offer.featured? Colors.white:Color(0xFF3730a2),fontSize: 24),),
                                    Text(offer.subtitle,style: TextStyle(color: offer.featured? Colors.white:Color(0xFF3730a2),fontSize: 16),),
                                    SizedBox(height: 5,),
                                    Row(children: [
                                      Container(
                                        // width: MediaQuery.sizeOf(context).width*0.12,
                                        // height: MediaQuery.sizeOf(context).height*0.015,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: offer.featured? Color(0xFF7e22cd):Color(0xFFa78bfa),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8,vertical: 2
                                          ),
                                          child: Text(offer.category,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
                                        ),),
                                      SizedBox(width: 10,),
                                      Visibility(
                                        visible:offer.discount.isNotEmpty,//can't be null
                                        child: Container(
                                          // width: MediaQuery.sizeOf(context).width*0.12,
                                          // height: MediaQuery.sizeOf(context).height*0.015,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: offer.featured?Colors.white:Color(0xFF7e22cd)),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 6,vertical: 2
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.sell_outlined,color: offer.featured?Colors.white:Color(0xFF7e22cd),size: 14,),
                                                  SizedBox(width: 6,),
                                                  Text(offer.discount ?? "",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: offer.featured?Colors.white:Color(0xFF7e22cd)),)
                                                ],
                                              )
                                            //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                          ),),
                                      ),
                                    ],),
                                    SizedBox(height: 5,),
                                    Row(children: [
                                      Icon(Icons.access_time,color:offer.featured? Colors.white:Color(0xFF7e22cd),size: 14,),
                                      SizedBox(width: 3,),
                                      Text(offer.validUntil,style: TextStyle(color: offer.featured?Colors.white:Color(0xFF3730a2),fontSize: 12,fontWeight: FontWeight.bold),)
                                    ],
                                    )

                                  ],
                                ),
                              ),
                              Visibility(
                                visible:offer.featured,
                                child: Container(
                                  // width: MediaQuery.sizeOf(context).width*0.12,
                                  // height: MediaQuery.sizeOf(context).height*0.015,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8,vertical: 2
                                    ),
                                    child: Text("Featured",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),),
                              ),

                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(children: [
                            Expanded(child: Text(offer.description,maxLines: 2,style: TextStyle(overflow: TextOverflow.ellipsis,color: offer.featured?Colors.white:Color(0xFF3730a2),fontSize: 13,fontWeight: FontWeight.bold),)),
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(children: [
                            Text(offer.oldPrice,style: TextStyle(color: offer.featured?Colors.white54:Colors.grey,fontSize: 16,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough,decorationColor: offer.featured?Colors.white54:Colors.grey,decorationThickness: 2,),),
                            SizedBox(width: 10,),
                            Text(offer.newPrice,style: TextStyle(fontWeight: FontWeight.bold,color:offer.featured? Colors.white:Color(0xFF7e22cd),fontSize: 18),),
                            Spacer(),
                            Container(
                              // width: MediaQuery.sizeOf(context).width*0.12,
                              // height: MediaQuery.sizeOf(context).height*0.015,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: offer.featured? Colors.white:Color(0xFF7e22cd),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8,vertical: 4
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.shopping_bag_outlined,color:offer.featured? Color(0xFF7e22cd):Colors.white,size: 20,),
                                      SizedBox(width: 5,),
                                      Text("Claim Offer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: offer.featured? Color(0xFF7e22cd):Colors.white),)
                                    ],
                                  )
                                //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                              ),)
                          ],)
                        ],
                      ),
                    ),
                  );},
                  separatorBuilder:(context,index)=>SizedBox(height: 10,) ),
              /* SingleChildScrollView(
               scrollDirection: Axis.vertical,
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10),
                     child: Container(
                       width: double.infinity,

                       decoration: BoxDecoration(
                         color: Color(0xFFa78bfa),
                         borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.0564),
                           boxShadow: [BoxShadow(
                             color: Colors.black12,
                             blurRadius: 10,
                             offset: Offset(-4, 4),
                             spreadRadius: 2,
                           )]
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.sizeOf(context).width * 0.035,
                                    vertical: MediaQuery.sizeOf(context).height * 0.016,
                                     ),
                         child: Column(
                           children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Column(
                                   children: [
                                     Container(
                                       width: MediaQuery.sizeOf(context).width *0.1,
                                       height: MediaQuery.sizeOf(context).width *0.1,
                                       decoration: BoxDecoration(
                                         color:Color(0xFFa78bfa),// const Color(0xFFA68AFA),
                                         borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.02),
                                       ),
                                       child: Icon(
                                         Icons.fitness_center,
                                         size:MediaQuery.sizeOf(context).width*0.08,
                                         color: Colors.white,
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(width: 20,),
                                 Expanded(
                                   child: Column(
                                     //mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Premium Gym Membership",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                                       Text("FitLife Wellness Center",style: TextStyle(color: Colors.white,fontSize: 13),),
                                       SizedBox(height: 5,),
                                       Row(children: [
                                         Container(
                                        // width: MediaQuery.sizeOf(context).width*0.12,
                                        // height: MediaQuery.sizeOf(context).height*0.015,
                                         alignment: Alignment.center,
                                         decoration: BoxDecoration(
                                         color: const Color(0xFF7e22cd),
                                         borderRadius: BorderRadius.circular(8),
                                       ),
                                         child: Padding(
                                           padding: const EdgeInsets.symmetric(
                                             horizontal: 8,vertical: 2
                                           ),
                                           child: Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                         ),),
                                         SizedBox(width: 10,),
                                         Container(
                                           // width: MediaQuery.sizeOf(context).width*0.12,
                                           // height: MediaQuery.sizeOf(context).height*0.015,
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             border: Border.all(
                                                 color: Colors.white),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 8,vertical: 2
                                             ),
                                             child: Row(
                                               children: [
                                                 Icon(Icons.sell_outlined,color: Colors.white,size: 12,),
                                                 SizedBox(width: 6,),
                                                 Text("30% off",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.white),)
                                               ],
                                             )
                                             //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                           ),),
                                       ],),
                                       SizedBox(height: 5,),
                                       Row(children: [
                                         Icon(Icons.access_time,color: Colors.white,size: 12,),
                                         SizedBox(width: 3,),
                                         Text("Valid until March 15",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)
                                       ],
                                       )

                                     ],
                                   ),
                                 ),
                                 Container(
                                     // width: MediaQuery.sizeOf(context).width*0.12,
                                     // height: MediaQuery.sizeOf(context).height*0.015,
                                     alignment: Alignment.center,
                                     decoration: BoxDecoration(
                                       color: Colors.white.withOpacity(0.2),
                                       borderRadius: BorderRadius.circular(8),
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.symmetric(
                                           horizontal: 8,vertical: 2
                                       ),
                                       child: Text("Featured",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                     ),),

                               ],
                             ),
                             SizedBox(height: 15,),
                             Row(children: [
                               Expanded(child: Text("Access to all equipment, group classes, and personal training sessions",maxLines: 2,style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),)),
                             ],
                             ),
                             SizedBox(height: 10,),
                             Row(children: [
                               Text("\$99",style: TextStyle(color: Colors.white54,fontSize: 13,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough,decorationColor: Colors.white54,decorationThickness: 2,),),
                               SizedBox(width: 10,),
                               Text("\$69",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),),
                               Spacer(),
                               Container(
                                 // width: MediaQuery.sizeOf(context).width*0.12,
                                 // height: MediaQuery.sizeOf(context).height*0.015,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 6,vertical: 2
                                     ),
                                     child: Row(
                                       children: [
                                         Icon(Icons.shopping_bag_outlined,color: Color(0xFF7e22cd),size: 18,),
                                         SizedBox(width: 5,),
                                         Text("Claim Offer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xFF7e22cd)),)
                                       ],
                                     )
                                   //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                 ),)
                             ],)
                           ],
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10),
                     child: Container(
                       width: double.infinity,

                       decoration: BoxDecoration(
                           color: Color(0xFFa78bfa),
                           borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.0564),
                           boxShadow: [BoxShadow(
                             color: Colors.black12,
                             blurRadius: 10,
                             offset: Offset(-4, 4),
                             spreadRadius: 2,
                           )]
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(
                           horizontal: MediaQuery.sizeOf(context).width * 0.035,
                           vertical: MediaQuery.sizeOf(context).height * 0.016,
                         ),
                         child: Column(
                           children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Column(
                                   children: [
                                     Container(
                                       width: MediaQuery.sizeOf(context).width *0.1,
                                       height: MediaQuery.sizeOf(context).width *0.1,
                                       decoration: BoxDecoration(
                                         color:Color(0xFFa78bfa),// const Color(0xFFA68AFA),
                                         borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.02),
                                       ),
                                       child: Icon(
                                         Icons.fitness_center,
                                         size:MediaQuery.sizeOf(context).width*0.08,
                                         color: Colors.white,
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(width: 20,),
                                 Expanded(
                                   child: Column(
                                     //mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Premium Gym Membership",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                                       Text("FitLife Wellness Center",style: TextStyle(color: Colors.white,fontSize: 13),),
                                       SizedBox(height: 5,),
                                       Row(children: [
                                         Container(
                                           // width: MediaQuery.sizeOf(context).width*0.12,
                                           // height: MediaQuery.sizeOf(context).height*0.015,
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             color: const Color(0xFF7e22cd),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 8,vertical: 2
                                             ),
                                             child: Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                           ),),
                                         SizedBox(width: 10,),
                                         Container(
                                           // width: MediaQuery.sizeOf(context).width*0.12,
                                           // height: MediaQuery.sizeOf(context).height*0.015,
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             border: Border.all(
                                                 color: Colors.white),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                           child: Padding(
                                               padding: const EdgeInsets.symmetric(
                                                   horizontal: 8,vertical: 2
                                               ),
                                               child: Row(
                                                 children: [
                                                   Icon(Icons.sell_outlined,color: Colors.white,size: 12,),
                                                   SizedBox(width: 6,),
                                                   Text("30% off",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.white),)
                                                 ],
                                               )
                                             //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                           ),),
                                       ],),
                                       SizedBox(height: 5,),
                                       Row(children: [
                                         Icon(Icons.access_time,color: Colors.white,size: 12,),
                                         SizedBox(width: 3,),
                                         Text("Valid until March 15",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)
                                       ],
                                       )

                                     ],
                                   ),
                                 ),
                                 Container(
                                   // width: MediaQuery.sizeOf(context).width*0.12,
                                   // height: MediaQuery.sizeOf(context).height*0.015,
                                   alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                     color: Colors.white.withOpacity(0.2),
                                     borderRadius: BorderRadius.circular(8),
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 8,vertical: 2
                                     ),
                                     child: Text("Featured",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                   ),),

                               ],
                             ),
                             SizedBox(height: 15,),
                             Row(children: [
                               Expanded(child: Text("Access to all equipment, group classes, and personal training sessions",maxLines: 2,style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),)),
                             ],
                             ),
                             SizedBox(height: 10,),
                             Row(children: [
                               Text("\$99",style: TextStyle(color: Colors.white54,fontSize: 13,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough,decorationColor: Colors.white54,decorationThickness: 2,),),
                               SizedBox(width: 10,),
                               Text("\$69",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),),
                               Spacer(),
                               Container(
                                 // width: MediaQuery.sizeOf(context).width*0.12,
                                 // height: MediaQuery.sizeOf(context).height*0.015,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 6,vertical: 2
                                     ),
                                     child: Row(
                                       children: [
                                         Icon(Icons.shopping_bag_outlined,color: Color(0xFF7e22cd),size: 18,),
                                         SizedBox(width: 5,),
                                         Text("Claim Offer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xFF7e22cd)),)
                                       ],
                                     )
                                   //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                 ),)
                             ],)
                           ],
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 5),
                     child: Container(
                       width: double.infinity,

                       decoration: BoxDecoration(
                           color: Color(0xFFa78bfa),
                           borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.0564),
                           boxShadow: [BoxShadow(
                             color: Colors.black12,
                             blurRadius: 10,
                             offset: Offset(-4, 4),
                             spreadRadius: 2,
                           )]
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(
                           horizontal: MediaQuery.sizeOf(context).width * 0.035,
                           vertical: MediaQuery.sizeOf(context).height * 0.016,
                         ),
                         child: Column(
                           children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Column(
                                   children: [
                                     Container(
                                       width: MediaQuery.sizeOf(context).width *0.1,
                                       height: MediaQuery.sizeOf(context).width *0.1,
                                       decoration: BoxDecoration(
                                         color:Color(0xFFa78bfa),// const Color(0xFFA68AFA),
                                         borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.02),
                                       ),
                                       child: Icon(
                                         Icons.fitness_center,
                                         size:MediaQuery.sizeOf(context).width*0.08,
                                         color: Colors.white,
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(width: 20,),
                                 Expanded(
                                   child: Column(
                                     //mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Premium Gym Membership",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                                       Text("FitLife Wellness Center",style: TextStyle(color: Colors.white,fontSize: 13),),
                                       SizedBox(height: 5,),
                                       Row(children: [
                                         Container(
                                           // width: MediaQuery.sizeOf(context).width*0.12,
                                           // height: MediaQuery.sizeOf(context).height*0.015,
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             color: const Color(0xFF7e22cd),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 8,vertical: 2
                                             ),
                                             child: Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                           ),),
                                         SizedBox(width: 10,),
                                         Container(
                                           // width: MediaQuery.sizeOf(context).width*0.12,
                                           // height: MediaQuery.sizeOf(context).height*0.015,
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             border: Border.all(
                                                 color: Colors.white),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                           child: Padding(
                                               padding: const EdgeInsets.symmetric(
                                                   horizontal: 8,vertical: 2
                                               ),
                                               child: Row(
                                                 children: [
                                                   Icon(Icons.sell_outlined,color: Colors.white,size: 12,),
                                                   SizedBox(width: 6,),
                                                   Text("30% off",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.white),)
                                                 ],
                                               )
                                             //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                           ),),
                                       ],),
                                       SizedBox(height: 5,),
                                       Row(children: [
                                         Icon(Icons.access_time,color: Colors.white,size: 12,),
                                         SizedBox(width: 3,),
                                         Text("Valid until March 15",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)
                                       ],
                                       )

                                     ],
                                   ),
                                 ),
                                 Container(
                                   // width: MediaQuery.sizeOf(context).width*0.12,
                                   // height: MediaQuery.sizeOf(context).height*0.015,
                                   alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                     color: Colors.white.withOpacity(0.2),
                                     borderRadius: BorderRadius.circular(8),
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 8,vertical: 2
                                     ),
                                     child: Text("Featured",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                   ),),

                               ],
                             ),
                             SizedBox(height: 15,),
                             Row(children: [
                               Expanded(child: Text("Access to all equipment, group classes, and personal training sessions",maxLines: 2,style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),)),
                             ],
                             ),
                             SizedBox(height: 10,),
                             Row(children: [
                               Text("\$99",style: TextStyle(color: Colors.white54,fontSize: 13,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough,decorationColor: Colors.white54,decorationThickness: 2,),),
                               SizedBox(width: 10,),
                               Text("\$69",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),),
                               Spacer(),
                               Container(
                                 // width: MediaQuery.sizeOf(context).width*0.12,
                                 // height: MediaQuery.sizeOf(context).height*0.015,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 6,vertical: 2
                                     ),
                                     child: Row(
                                       children: [
                                         Icon(Icons.shopping_bag_outlined,color: Color(0xFF7e22cd),size: 18,),
                                         SizedBox(width: 5,),
                                         Text("Claim Offer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xFF7e22cd)),)
                                       ],
                                     )
                                   //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                 ),)
                             ],)
                           ],
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 5),
                     child: Container(
                       width: double.infinity,

                       decoration: BoxDecoration(
                           color: Color(0xFFa78bfa),
                           borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.0564),
                           boxShadow: [BoxShadow(
                             color: Colors.black12,
                             blurRadius: 10,
                             offset: Offset(-4, 4),
                             spreadRadius: 2,
                           )]
                       ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(
                           horizontal: MediaQuery.sizeOf(context).width * 0.035,
                           vertical: MediaQuery.sizeOf(context).height * 0.016,
                         ),
                         child: Column(
                           children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Column(
                                   children: [
                                     Container(
                                       width: MediaQuery.sizeOf(context).width *0.1,
                                       height: MediaQuery.sizeOf(context).width *0.1,
                                       decoration: BoxDecoration(
                                         color:Color(0xFFa78bfa),// const Color(0xFFA68AFA),
                                         borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).width*0.02),
                                       ),
                                       child: Icon(
                                         Icons.fitness_center,
                                         size:MediaQuery.sizeOf(context).width*0.08,
                                         color: Colors.white,
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(width: 20,),
                                 Expanded(
                                   child: Column(
                                     //mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Premium Gym Membership",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                                       Text("FitLife Wellness Center",style: TextStyle(color: Colors.white,fontSize: 13),),
                                       SizedBox(height: 5,),
                                       Row(children: [
                                         Container(
                                           // width: MediaQuery.sizeOf(context).width*0.12,
                                           // height: MediaQuery.sizeOf(context).height*0.015,
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             color: const Color(0xFF7e22cd),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(
                                                 horizontal: 8,vertical: 2
                                             ),
                                             child: Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                           ),),
                                         SizedBox(width: 10,),
                                         Container(
                                           // width: MediaQuery.sizeOf(context).width*0.12,
                                           // height: MediaQuery.sizeOf(context).height*0.015,
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             border: Border.all(
                                                 color: Colors.white),
                                             borderRadius: BorderRadius.circular(8),
                                           ),
                                           child: Padding(
                                               padding: const EdgeInsets.symmetric(
                                                   horizontal: 8,vertical: 2
                                               ),
                                               child: Row(
                                                 children: [
                                                   Icon(Icons.sell_outlined,color: Colors.white,size: 12,),
                                                   SizedBox(width: 6,),
                                                   Text("30% off",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.white),)
                                                 ],
                                               )
                                             //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                           ),),
                                       ],),
                                       SizedBox(height: 5,),
                                       Row(children: [
                                         Icon(Icons.access_time,color: Colors.white,size: 12,),
                                         SizedBox(width: 3,),
                                         Text("Valid until March 15",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)
                                       ],
                                       )

                                     ],
                                   ),
                                 ),
                                 Container(
                                   // width: MediaQuery.sizeOf(context).width*0.12,
                                   // height: MediaQuery.sizeOf(context).height*0.015,
                                   alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                     color: Colors.white.withOpacity(0.2),
                                     borderRadius: BorderRadius.circular(8),
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 8,vertical: 2
                                     ),
                                     child: Text("Featured",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                   ),),

                               ],
                             ),
                             SizedBox(height: 15,),
                             Row(children: [
                               Expanded(child: Text("Access to all equipment, group classes, and personal training sessions",maxLines: 2,style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),)),
                             ],
                             ),
                             SizedBox(height: 10,),
                             Row(children: [
                               Text("\$99",style: TextStyle(color: Colors.white54,fontSize: 13,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough,decorationColor: Colors.white54,decorationThickness: 2,),),
                               SizedBox(width: 10,),
                               Text("\$69",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),),
                               Spacer(),
                               Container(
                                 // width: MediaQuery.sizeOf(context).width*0.12,
                                 // height: MediaQuery.sizeOf(context).height*0.015,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: Padding(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 6,vertical: 2
                                     ),
                                     child: Row(
                                       children: [
                                         Icon(Icons.shopping_bag_outlined,color: Color(0xFF7e22cd),size: 18,),
                                         SizedBox(width: 5,),
                                         Text("Claim Offer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xFF7e22cd)),)
                                       ],
                                     )
                                   //Text("Fitness",style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold),),
                                 ),)
                             ],)
                           ],
                         ),
                       ),
                     ),
                   ),

                 ],
               ),
             )*/
              SizedBox(height: 10,),
              MaterialButton(onPressed: (){},
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color:  Color(0xFF7e22cd)),),child: Text("Load More Offers",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF3730a2)),),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),


    );
  }

}