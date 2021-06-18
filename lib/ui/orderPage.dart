import 'package:flutter/material.dart';
import 'package:abdullah/themes/themes.dart';

// The Product Order View , with it's pop up window

AnimationController an;

class orderPage extends StatefulWidget {
  @override
  _orderPageState createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  AnimationController _controller2;
  Animation<double> _animation2;

  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 1000,
      ),
      vsync: this,
      value: 0.0,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );

    _controller2 = AnimationController(
      duration: const Duration(
        milliseconds: 1000,
      ),
      vsync: this,
      value: 0.0,
    );
    _animation2 = CurvedAnimation(
      parent: _controller2,
      curve: Curves.bounceIn,
    );
  }

  @override
  dispose() {
    _controller.dispose();
    _controller2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var args = ModalRoute.of(context).settings.arguments;

    if (args == null) {
      args = "1";
    }

    return Material(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz_outlined),
            )
          ],
          title: Text("Product Details"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/" + args + ".jpg",
                        height: screenHeight / 4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Text(
                        "Adidas S21",
                        style: AppThemeData.mainTextStyle,
                      )),
                      TextButton(
                          onPressed: () async {
                            await _controller.animateTo(1);
                            _controller.duration *= 0.5;
                            await _controller.animateTo(0);
                            _controller.duration *= 2;
                          },
                          child: Row(
                            children: [
                              Text(
                                "Love it",
                                style: AppThemeData.secondStyle,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              )
                            ],
                          )),
                    ],
                  ),
                  Text(
                    "   3512 \$",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture, with appearance originally being tied to function",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "PowerFull",
                                style: AppThemeData.secondStyle,
                              ),
                              Text(
                                "51.3%",
                                style: AppThemeData.mainTextStyle,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Minimalist",
                                style: AppThemeData.secondStyle,
                              ),
                              Text(
                                "77.2%",
                                style: AppThemeData.mainTextStyle,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Ratings",
                                style: AppThemeData.secondStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // color: Colors.blue[50],
                      child: Row(
                        children: [
                          ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                            ),
                            onPressed: () {},
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _openCustomDialog(
                                      context, _animation2, _controller2);
                                  _controller2.animateTo(1);
                                },
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(20)),
                                    elevation: MaterialStateProperty.all(10),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueAccent)),
                                child: Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 250,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//opens the window with animation
void _openCustomDialog(BuildContext context, anim, cont) {
  an = cont;

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
                    AnimPos(),
                    Center(
                      child: ScaleTransition(
                        scale: anim,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.amber,
                            size: 200,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () {
                                Navigator.popAndPushNamed(context, '/home');
                              },
                              label: Text(
                                "Cart",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.home),
                              onPressed: () {
                                Navigator.popAndPushNamed(context, '/home');
                              },
                              label: Text(
                                "Home",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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

// animation for the small boot image
class AnimPos extends StatefulWidget {
  // AnimPos(this.an);

  @override
  _AnimPosState createState() => _AnimPosState();
}

class _AnimPosState extends State<AnimPos> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        selected = true;
      });
    });

    return Stack(
      children: [
        AnimatedPositioned(
          top: !selected ? 5.0 : 80.0,
          right: MediaQuery.of(context).size.width / 4.5,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: CircleAvatar(
            foregroundImage: AssetImage("assets/images/1.jpg"),
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            radius: 40,
          ),
        ),
        SizedBox(
          height: 150,
        ),
      ],
    );
  }
}
