import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kied/model/order_item.dart';

class HealthController extends GetxController {
  RxDouble ebit = (0.0).obs,
      netProfit = (0.0).obs,
      shareHolderEquity = (1.0).obs,
      capEmplyed = (1.0).obs;
  RxDouble totalAssets = (0.0).obs,

      /// Current employed is originally current Liabilities
      currentEmployed = (0.0).obs,
      presntVal = (0.0).obs,
      pastVal = (1.0).obs,
      interestExpense = (1.0).obs,
      totalLiability = (0.0).obs;
  RxDouble totalRevenue = (0.0).obs,
      totalExpense = (0.0).obs,
      tax = (0.0).obs,
      interest = (0.0).obs;
  RxDouble roce = (0.0).obs,
      profitGrowth = (0.0).obs,
      roe = (0.0).obs,
      intrestCourageRatio = (0.0).obs,
      debtEqtRatio = (0.0).obs;
  RxInt health = 0.obs;
  calculateHealth() {
    health.value = ((roce.value > 30) ? 2 : 0) +
        ((roe.value > 30) ? 2 : 0) +
        ((profitGrowth.value > 30) ? 2 : 0) +
        ((intrestCourageRatio.value > 30) ? 2 : 0) +
        ((debtEqtRatio.value > 30) ? 2 : 0);
  }

  editCapEmplyed(double val) {
    capEmplyed.value = val;
    roce.value = ebit.value / val;
    calculateHealth();
  }

  editShareHolderEquity(double val) {
    shareHolderEquity.value = val;
    roe.value = netProfit.value / val;
    debtEqtRatio.value = totalLiability.value / val;
    calculateHealth();
  }

  editEbit(double val) {
    ebit.value = val;
    roce.value = val / capEmplyed.value;

    intrestCourageRatio.value = val / interestExpense.value;
    calculateHealth();
  }

  editNetProfit(double val) {
    netProfit.value = val;
    roe.value = val / shareHolderEquity.value;
    editEbit(val + interest.value + tax.value);
    calculateHealth();
  }

  editPresentVal(double val) {
    presntVal.value = val;
    profitGrowth.value = (val - pastVal.value) / pastVal.value * 100;
    calculateHealth();
  }

  editPastVal(double val) {
    pastVal.value = val;
    profitGrowth.value = (presntVal.value - val) / val * 100;
    calculateHealth();
  }

  editInterestExpense(double val) {
    interestExpense.value = val;
    intrestCourageRatio.value = ebit.value / val;
    calculateHealth();
  }

  editTotalLiability(double val) {
    totalLiability.value = val;
    editShareHolderEquity(totalAssets.value - val);
    debtEqtRatio.value = val / shareHolderEquity.value;
    calculateHealth();
  }

  editTotalAssets(double val) {
    totalAssets.value = val;
    editShareHolderEquity(val - totalLiability.value);
    editCapEmplyed(val - currentEmployed.value);
  }

  editInterest(double val) {
    interest.value = val;
    editEbit(netProfit.value + val + tax.value);
  }

  editTax(double val) {
    tax.value = val;
    editEbit(netProfit.value + val + interest.value);
    editNetProfit(totalRevenue.value - totalExpense.value - val);
  }

  editCurrentEmployed(double val) {
    currentEmployed.value = val;
    editCapEmplyed(totalAssets.value - val);
  }

  editTotalRevueue(double val) {
    totalRevenue.value = val;
    editNetProfit(val - totalExpense.value - tax.value);
  }

  editTotalExpense(double val) {
    totalExpense.value = val;
    editNetProfit(totalRevenue.value - val - tax.value);
  }
}

/*
Inputs:  Present Value, Past Value, Interest Expense, >>>>>>>>> Total Liability
        For EBIT & Net Profit: Total Revenue, Total Expense, Taxes, Interest,totalAssets,CurrentEmployed,
 */