import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';




class KalkulatorPageContent extends StatefulWidget {
  final Function(String, String) onCalculation;

  const KalkulatorPageContent({Key? key, required this.onCalculation})
      : super(key: key);

  @override
  KalkulatorPageContentState createState() => KalkulatorPageContentState();
}


class KalkulatorPageContentState extends State<KalkulatorPageContent> {
  String _output = "0";
  String _expression = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _expression = "";
      } else if (buttonText == "=") {
    try {
        String formattedExpression = _expression.replaceAll("x", "*");
        Parser p = Parser();
        Expression exp = p.parse(formattedExpression);
        ContextModel cm = ContextModel();
        _output = exp.evaluate(EvaluationType.REAL, cm).toString();
        
        // Save the complete expression and result to history
        widget.onCalculation(_expression, _output);
        
        _expression = _output;
    } catch (e) {
        _output = "Error";
    }

      } else if (buttonText == "Hapus" || buttonText == "DEL") {
        if (_expression.isNotEmpty) {
          _expression = _expression.substring(0, _expression.length - 1);
          _output = _expression.isEmpty ? "0" : _expression;
        }
      } else {
        if (_expression.isEmpty &&
            (buttonText == "+" ||
                buttonText == "-" ||
                buttonText == "x" ||
                buttonText == "/")) {
          return;
        }
        if ((buttonText == "+" ||
                buttonText == "-" ||
                buttonText == "x" ||
                buttonText == "/") &&
            (_expression.endsWith("+") ||
                _expression.endsWith("-") ||
                _expression.endsWith("x") ||
                _expression.endsWith("/"))) {
          return;
        }
        _expression += buttonText;
        _output = _expression;
      }
    });
  }

  Widget _buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () => buttonPressed(buttonText),
      child: buttonText == "Hapus" || buttonText == "DEL"
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.backspace, size: 24),
                SizedBox(width: 4),
                Text("", style: TextStyle(fontSize: 24)),
              ],
            )
          : Text(
              buttonText,
              style: TextStyle(fontSize: 24),
            ),
    );
  }

@override
Widget build(BuildContext context) {
  return Center(
    child: Container(
      constraints: BoxConstraints(
        maxWidth: 400,
        maxHeight: 600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Kalkulator",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48),
                textAlign: TextAlign.right,
              ),
            ),
            // Rest of the existing code remains the same

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Add even spacing
                children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("x"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton("C"),
                    _buildButton("0"),
                    _buildButton("="),
                    _buildButton("+"),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildButton("DEL"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )
    ),
  );
  

  }
  
}




