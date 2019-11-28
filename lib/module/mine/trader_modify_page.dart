import 'package:flutter/material.dart';
import 'package:flutter_stocks_statistics/data/api/trader_api.dart';
import 'package:flutter_stocks_statistics/data/entity/trader_info.dart';
import 'package:flutter_stocks_statistics/util/toast_helper.dart';
import 'package:flutter_stocks_statistics/widget/common/appbar.dart';
import 'package:flutter_stocks_statistics/widget/common/input_item.dart';

class TraderModifyPage extends StatefulWidget {
  final int traderId;

  TraderModifyPage({this.traderId});

  @override
  State<StatefulWidget> createState() => _TraderModifyPageState();
}

class _TraderModifyPageState extends State<TraderModifyPage> {
  TextEditingController _traderNameController;
  TextEditingController _financingFeeController;
  TextEditingController _winningFeeController;
  TextEditingController _subscribeFeeController;
  TextEditingController _tradingFeeController;
  TextEditingController _tradingRateController;
  TextEditingController _otherFeeController;

  @override
  void initState() {
    _traderNameController = new TextEditingController();
    _financingFeeController = new TextEditingController();
    _winningFeeController = new TextEditingController();
    _subscribeFeeController = new TextEditingController();
    _tradingFeeController = new TextEditingController();
    _tradingRateController = new TextEditingController();
    _otherFeeController = new TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _traderNameController.dispose();
    _financingFeeController.dispose();
    _winningFeeController.dispose();
    _subscribeFeeController.dispose();
    _tradingFeeController.dispose();
    _tradingRateController.dispose();
    _otherFeeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CommonAppBar(
        widget.traderId == null ? "新增" : "修改",
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.traderId == null ? addTrader() : updateTrader();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CommonInputItem(
            "券商名字",
            _traderNameController,
          ),
          CommonInputItem(
            "融资手续费",
            _financingFeeController,
          ),
          CommonInputItem(
            "申购手续费",
            _subscribeFeeController,
          ),
          CommonInputItem(
            "中签手续费",
            _winningFeeController,
          ),
          CommonInputItem(
            "交易手续费",
            _tradingFeeController,
          ),
          CommonInputItem(
            "交易费率",
            _tradingRateController,
          ),
          CommonInputItem(
            "其他手续费",
            _otherFeeController,
          ),
        ],
      ),
    );
  }

  Future addTrader() async {
    TraderInfo info = new TraderInfo();
    info.name = _traderNameController.text;
    info.financingFee = int.parse(_financingFeeController.text);
    info.winningFee = int.parse(_winningFeeController.text);
    info.subscriberFee = int.parse(_subscribeFeeController.text);
    info.tradingFee = int.parse(_tradingFeeController.text);
    info.tradingRate = int.parse(_tradingRateController.text);
    info.otherFee = int.parse(_otherFeeController.text);

    await TraderApi.addTrader(info).then((success) {
      if (success) {
        Navigator.pop(context);
      } else {
        ToastHelper.showErrorToast("add fail！！！");
      }
    });
  }

  Future updateTrader() async {}
}

class HintInputItem extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;

  HintInputItem(this.text, {this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.centerLeft,
          width: 100,
          height: 50,
          child: Text(
            text,
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
        Expanded(
          child: CommonInputItem(
            "",
            controller,
            hintText: hintText,
            padding: EdgeInsets.only(left: 2, right: 10),
          ),
        ),
      ],
    );
  }
}

class HintInputItemDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Divider(
      height: 1,
      color: Color(0xFF999999),
    );
  }
}
