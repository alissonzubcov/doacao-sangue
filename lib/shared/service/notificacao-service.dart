
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:semana_info_flutter/shared/model/notification_model.dart';

class NotificacaoService{

  static Future<void> registrarNotificacaoAll(NotificationMessage notificationMessage) async {
    String _url = "https://fcm.googleapis.com/fcm/send";
    http.Response response;

    Map<dynamic, dynamic> notification = new  Map<dynamic, dynamic>();
    notification["title"] = notificationMessage.title;
    notification["body"] = notificationMessage.body;
    // notification["image"] = notificationMessage.image;

    Map<dynamic, dynamic> corpo = new  Map<dynamic, dynamic>();

    corpo["to"] = "/topics/all";
    corpo["notification"] = notification;

    var body = json.encode(corpo);

 
    response = await http.post(_url,
        headers: {"Content-Type": "application/json", 'authorization':'key = AAAA3SG6ZSw:APA91bEnabBKUo0TKiUgo96ltgrBOMaxV-BekhxvxxuMp6iIhm-OWPIwMRT1bCwDcvGLXSVMnMcTVllXv3G2d1QRgWTsrgJPho-cuuAxbA05ebL8ZFn2_mHWip09FHdVW-igWgNTBseY'},
        body: body);
    print(response.body);
    print('envio msg');
  }
}