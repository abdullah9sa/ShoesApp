import 'package:abdullah/ui/orderPage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// provides the images and the grid for the homePage

class ItemsGrid extends StatelessWidget {
  int itemsNumber;

  ItemsGrid(this.itemsNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(itemsNumber, (index) {
          int n = index + 1;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[50],
                  // offset: Offset(0.0, 0.2), //(x,y)
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FittedBox(
                child: TextButton(
                  onPressed: () {
                    _openCustomDialog(context, n);
                    // _showOrder(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  // child: Image.network(lnk)
                  child: Image.asset(
                    'assets/images/$n.jpg',
                    // color: Color.fromRGBO(100, 100, 100, .2),
                  ),
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
        }),
      ),
    );
  }
}

void _openCustomDialog(BuildContext context, int n) {
  double screenHeight = MediaQuery.of(context).size.height;

  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: ListBody(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/$n.jpg",
                        height: screenHeight / 3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(20),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(20)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ))),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/order',
                              arguments: n.toString());
                          // Navigator.of(context).push(_anmRoute());
                          //Navigator.of(context).pop();
                        },
                        child: Text(
                          "Show Details",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {});
}
