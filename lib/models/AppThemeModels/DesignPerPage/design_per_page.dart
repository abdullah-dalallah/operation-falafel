// To parse this JSON data, do
//
//     final designPerPage = designPerPageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/AddNewAddressPage/Add_new_address_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/BottomNavigationBar/bottom_navigation_bar_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CartPage/cart_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Drawer-ContactUsPage/drawer_content_us_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Drawer-FeedBackPage/drawer_feedback_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Drawer-NotificationPage/drawer_notification_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Drawer-PartnersPage/drawer_partners_page.dart';
import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Drawer/drawer.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/EditAddressPage/edit_address_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/EnterOFWorldPage/enter_of_world_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/ForgetPasswordPage/forget_password_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/HelpPage/help_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/HomePage/home_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/ItemDetailsSheet/item_details_sheet.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/LoginPage/login_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-BuyGiftPage/loyalty_buy_gift_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-CreditCalculationPage/loyalty_credit_calculation_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-GiftDetailsPage/loyalty_gift_detail_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-HistoryPage/loyalty_history_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-HowItWorkPage/loyalty_how_it_work_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-MyGiftsPage/loyalty_my_gifts_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-MyRewardsPage/loyalty_my_rewards_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-PaymentSheet/loyalty_payment_sheet.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-SendAsGiftPage/loyalty_send_as_gift_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-TransferCreditPage/loyalty_transfer_credit_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/LoyaltyPage/loyalty_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/MenuPage/menu_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/OrderDetailsPage/order_details_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/OrderHistoryPage/order_history_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/ProfilePage/profile_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/RegisterPage/register_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/SavedAddressPage/saved_address_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/SavedCardsPage/saved_cards_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/TarckOrderPage/track_order_page.dart';

DesignPerPage designPerPageFromJson(String str) => DesignPerPage.fromJson(json.decode(str));

String designPerPageToJson(DesignPerPage data) => json.encode(data.toJson());

class DesignPerPage {
  DesignPerPage({
    required this.bottomNavigationBar,
    required this.homePage,
    required this.tarckOrderPage,
    required this.cartPage,
    required this.menuPage,
    required this.itemDetailsSheet,
    required this.profilePage,
    required this.enterOfWorldPage,
    required this.registerPage,
    required this.loginPage,
    required this.forgetPasswordPage,
    required this.orderHistoryPage,
    required this.orderDetailsPage,
    required this.savedAddressPage,
    required this.editAddressPage,
    required this.addNewAddressPage,
    required this.savedCardsPage,
    required this.helpPage,
    required this.loyaltyPage,
    required this.loyaltyHowItWorkPage,
    required this.loyaltyMyRewardsPage,
    required this.loyaltyMyGiftsPage,
    required this.loyaltyGiftDetailsPage,
    required this.loyaltySendAsGiftPage,
    required this.loyaltyBuyGiftPage,
    required this.loyaltyPaymentSheet,
    required this.loyaltyTransferCreditPage,
    required this.loyaltyCreditCalculationPage,
    required this.loyaltyHistoryPage,
    required this.drawer,
    required this.drawerNotificationPage,
    required this.drawerPartnersPage,
    required this.drawerFeedBackPage,
    required this.drawerContactUsPage,
  });

  BottomNavigationButtonBar bottomNavigationBar;
  HomePage homePage;
  TarckOrderPage tarckOrderPage;
  CartPage cartPage;
  MenuPage menuPage;
  ItemDetailsSheet itemDetailsSheet;
  ProfilePage profilePage;
  EnterOfWorldPage enterOfWorldPage;
  RegisterPage registerPage;
  LoginPage loginPage;
  ForgetPasswordPage forgetPasswordPage;
  OrderHistoryPage orderHistoryPage;
  OrderDetailsPage orderDetailsPage;
  SavedAddressPage savedAddressPage;
  EditAddressPage editAddressPage;
  AddNewAddressPage addNewAddressPage;
  SavedCardsPage savedCardsPage;
  HelpPage helpPage;
  LoyaltyPage loyaltyPage;
  LoyaltyHowItWorkPage loyaltyHowItWorkPage;
  LoyaltyMyRewardsPage loyaltyMyRewardsPage;
  LoyaltyMyGiftsPage loyaltyMyGiftsPage;
  LoyaltyGiftDetailsPage loyaltyGiftDetailsPage;
  LoyaltySendAsGiftPage loyaltySendAsGiftPage;
  LoyaltyBuyGiftPage loyaltyBuyGiftPage;
  LoyaltyPaymentSheet loyaltyPaymentSheet;
  LoyaltyTransferCreditPage loyaltyTransferCreditPage;
  LoyaltyCreditCalculationPage loyaltyCreditCalculationPage;
  LoyaltyHistoryPage loyaltyHistoryPage;
  Drawer drawer;
  DrawerNotificationPage drawerNotificationPage;
  DrawerPartnersPage drawerPartnersPage;
  DrawerFeedBackPage drawerFeedBackPage;
  DrawerContactUsPage drawerContactUsPage;

  factory DesignPerPage.fromJson(Map<String, dynamic> json) => DesignPerPage(
    bottomNavigationBar: BottomNavigationButtonBar.fromJson(json["BottomNavigationBar"]),
    homePage: HomePage.fromJson(json["HomePage"]),
    tarckOrderPage: TarckOrderPage.fromJson(json["TarckOrderPage"]),
    cartPage: CartPage.fromJson(json["CartPage"]),
    menuPage: MenuPage.fromJson(json["MenuPage"]),
    itemDetailsSheet: ItemDetailsSheet.fromJson(json["ItemDetailsSheet"]),
    profilePage: ProfilePage.fromJson(json["ProfilePage"]),
    enterOfWorldPage: EnterOfWorldPage.fromJson(json["EnterOFWorldPage"]),
    registerPage: RegisterPage.fromJson(json["RegisterPage"]),
    loginPage: LoginPage.fromJson(json["LoginPage"]),
    forgetPasswordPage: ForgetPasswordPage.fromJson(json["ForgetPasswordPage"]),
    orderHistoryPage: OrderHistoryPage.fromJson(json["OrderHistoryPage"]),
    orderDetailsPage: OrderDetailsPage.fromJson(json["OrderDetailsPage"]),
    savedAddressPage: SavedAddressPage.fromJson(json["SavedAddressPage"]),
    editAddressPage: EditAddressPage.fromJson(json["EditAddressPage"]),
    addNewAddressPage: AddNewAddressPage.fromJson(json["AddNewAddressPage"]),
    savedCardsPage: SavedCardsPage.fromJson(json["SavedCardsPage"]),
    helpPage: HelpPage.fromJson(json["HelpPage"]),
    loyaltyPage: LoyaltyPage.fromJson(json["LoyaltyPage"]),
    loyaltyHowItWorkPage: LoyaltyHowItWorkPage.fromJson(json["Loyalty-HowItWorkPage"]),
    loyaltyMyRewardsPage: LoyaltyMyRewardsPage.fromJson(json["Loyalty-MyRewardsPage"]),
    loyaltyMyGiftsPage: LoyaltyMyGiftsPage.fromJson(json["Loyalty-MyGiftsPage"]),
    loyaltyGiftDetailsPage: LoyaltyGiftDetailsPage.fromJson(json["Loyalty-GiftDetailsPage"]),
    loyaltySendAsGiftPage: LoyaltySendAsGiftPage.fromJson(json["Loyalty-SendAsGiftPage"]),
    loyaltyBuyGiftPage: LoyaltyBuyGiftPage.fromJson(json["Loyalty-BuyGiftPage"]),
    loyaltyPaymentSheet: LoyaltyPaymentSheet.fromJson(json["Loyalty-PaymentSheet"]),
    loyaltyTransferCreditPage: LoyaltyTransferCreditPage.fromJson(json["Loyalty-TransferCreditPage"]),
    loyaltyCreditCalculationPage: LoyaltyCreditCalculationPage.fromJson(json["Loyalty-CreditCalculationPage"]),
    loyaltyHistoryPage: LoyaltyHistoryPage.fromJson(json["Loyalty-HistoryPage"]),
    drawer: Drawer.fromJson(json["Drawer"]),
    drawerNotificationPage: DrawerNotificationPage.fromJson(json["Drawer-NotificationPage"]),
    drawerPartnersPage: DrawerPartnersPage.fromJson(json["Drawer-PartnersPage"]),
    drawerFeedBackPage: DrawerFeedBackPage.fromJson(json["Drawer-FeedBackPage"]),
    drawerContactUsPage: DrawerContactUsPage.fromJson(json["Drawer-ContactUsPage"]),
  );

  Map<String, dynamic> toJson() => {
    "BottomNavigationBar": bottomNavigationBar.toJson(),
    "HomePage": homePage.toJson(),
    "TarckOrderPage": tarckOrderPage.toJson(),
    "CartPage": cartPage.toJson(),
    "MenuPage": menuPage.toJson(),
    "ItemDetailsSheet": itemDetailsSheet.toJson(),
    "ProfilePage": profilePage.toJson(),
    "EnterOFWorldPage": enterOfWorldPage.toJson(),
    "RegisterPage": registerPage.toJson(),
    "LoginPage": loginPage.toJson(),
    "ForgetPasswordPage": forgetPasswordPage.toJson(),
    "OrderHistoryPage": orderHistoryPage.toJson(),
    "OrderDetailsPage": orderDetailsPage.toJson(),
    "SavedAddressPage": savedAddressPage.toJson(),
    "EditAddressPage": editAddressPage.toJson(),
    "AddNewAddressPage": addNewAddressPage.toJson(),
    "SavedCardsPage": savedCardsPage.toJson(),
    "HelpPage": helpPage.toJson(),
    "LoyaltyPage": loyaltyPage.toJson(),
    "Loyalty-HowItWorkPage": loyaltyHowItWorkPage.toJson(),
    "Loyalty-MyRewardsPage": loyaltyMyRewardsPage.toJson(),
    "Loyalty-MyGiftsPage": loyaltyMyGiftsPage.toJson(),
    "Loyalty-GiftDetailsPage": loyaltyGiftDetailsPage.toJson(),
    "Loyalty-SendAsGiftPage": loyaltySendAsGiftPage.toJson(),
    "Loyalty-BuyGiftPage": loyaltyBuyGiftPage.toJson(),
    "Loyalty-PaymentSheet": loyaltyPaymentSheet.toJson(),
    "Loyalty-TransferCreditPage": loyaltyTransferCreditPage.toJson(),
    "Loyalty-CreditCalculationPage": loyaltyCreditCalculationPage.toJson(),
    "Loyalty-HistoryPage": loyaltyHistoryPage.toJson(),
    "Drawer": drawer.toJson(),
    "Drawer-NotificationPage": drawerNotificationPage.toJson(),
    "Drawer-PartnersPage": drawerPartnersPage.toJson(),
    "Drawer-FeedBackPage": drawerFeedBackPage.toJson(),
    "Drawer-ContactUsPage": drawerContactUsPage.toJson(),
  };
}
