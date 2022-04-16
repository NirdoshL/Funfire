import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiPaymentPage extends StatefulWidget {
  const KhaltiPaymentPage({Key? key,required this.fee}) : super(key: key);
  final  String fee;
  @override
  State<KhaltiPaymentPage> createState() => _KhaltiPaymentPageState();
}
class _KhaltiPaymentPageState extends State<KhaltiPaymentPage> {
  TextEditingController amountController = TextEditingController();
  getAmt() {
  return int.parse(amountController.text) * 100; // Converting to paisa
  }
  @override
  void initState() {
  amountController.text=widget.fee;
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: const Text('Khalti Payment Integration'),
  ),
  body: Container(
  padding: const EdgeInsets.all(15),
  child: ListView(
  children: [
  const SizedBox(height: 15),
   // For Amount
  const Text("Amount to pay is",style: TextStyle(color: Color(0xFF56328c), fontSize: 22),),
  Text(widget.fee,style: const TextStyle(color: Color(0xFF56328c), fontSize: 22),),
  const SizedBox(
  height: 8,
  ),
   // For Button
  MaterialButton(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8),
  side: const BorderSide(color: Colors.red)),
  height: 50,
  color: const Color(0xFF56328c),
  child: const Text(
  'Pay With Khalti',
  style: TextStyle(color: Colors.white, fontSize: 22),
  ),
  onPressed: () {
  KhaltiScope.of(context).pay(
  config: PaymentConfig(
  amount: getAmt(),
  productIdentity: 'dells-sssssg5-g5510-2021',
  productName: 'Product Name',
  ),
  preferences: [
  PaymentPreference.khalti,
  ],
  onSuccess: (su) {
  const successsnackBar = SnackBar(
  content: Text('Payment Successful'),
  );
  ScaffoldMessenger.of(context)
  .showSnackBar(successsnackBar);
  },
  onFailure: (fa) {
  const failedsnackBar = SnackBar(
  content: Text('Payment Failed'),
  );
  ScaffoldMessenger.of(context)
  .showSnackBar(failedsnackBar);
  },
  onCancel: () {
  const cancelsnackBar = SnackBar(
  content: Text('Payment Cancelled'),
  );
  ScaffoldMessenger.of(context)
  .showSnackBar(cancelsnackBar);
  },
  );
  }),
  ],
  ),
  ),
  );
  }
}