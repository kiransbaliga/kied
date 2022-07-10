import 'package:flutter/material.dart';
import 'package:kied/Screens/TabScreens/tabpage.dart';
class Invoice extends StatelessWidget {
  const Invoice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(69, 224, 224, 254),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 43,
                ),
                Image(
                  width: 800,
                  image: AssetImage('assets/images/invoice-banner.png'),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        formqstn(
                          data: 'Customer Name',
                          hint: 'Customer name',
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Order Number',
                          hint: 'Order Number',
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Terms',
                          hint: 'Due On Recipt',
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Salesperson',
                          hint: 'select a salesperson',
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Terms & Conditions',
                          hint: 'specify terms & conditions',
                          onchanged: (text) {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        formqstn(
                          data: 'Invoice Number',
                          hint: '#invoice',
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Invoice Date',
                          hint: 'dd-mm-yyyy',
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Due Date',
                          hint: 'dd-mm-yyyy',
                          onchanged: (text) {},
                        ),
                        formqstn(
                          data: 'Customer Note',
                          hint: 'Thank you for your business',
                          onchanged: (text) {},
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Color(0xff14D19D)),
                            ),
                            child: ListTile(
                              leading: Text(
                                'Upload File',
                                style: TextStyle(
                                  color: Color(0xff14D19D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Icon(
                                Icons.upload_rounded,
                                color: Color(0xff14D19D),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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