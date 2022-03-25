import 'package:flutter/material.dart';

Color primaryBlack = Color(0xff202c3b);

class DataSource {
  static String quote =
      "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less.";

  static List questionAnswers = [
    {
      "question":
          "Vắc-xin COVID-19 có an toàn dù vắc-xin này được phát triển nhanh chóng?",
      "answer":
          "Dù vắc-xin COVID-19 được phát triển nhanh chóng, tất cả các bước đã được thực hiện nhằm đảm bảo chúng an toàn và có hiệu quả. Thử nghiệm lâm sàng - Toàn bộ vắc-xin tại Hoa Kỳ phải trải qua ba giai đoạn thử nghiệm lâm sàng nhằm đảm bảo các vắc-xin đó an toàn và hiệu quả. Trong khi phát triển vắc-xin ngừa COVID-19, các giai đoạn gối lên nhau để đẩy nhanh tiến trình nhưng tất cả các giai đoạn đều đã hoàn thành."
    },
    {
      "question": "Tôi cần tiêm vắc xin để là việc không?",
      "answer":
          "Chủ lao động có thể yêu cầu công nhân của họ phải được chủng ngừa. Kiểm tra xem chủ lao động của quý vị có yêu cầu nào cần quý vị tuân thủ hay không. Hỏi chủ lao động của quý vị xem họ có cung cấp vắc-xin cho nhân viên không và họ có cho quý vị thời gian nghỉ để tiêm vắc-xin hay không. Nếu quý vị là nhà thầu hoặc làm việc ngoài công trường, hãy thảo luận về các lựa chọn tiêm chủng bổ sung với chủ lao động của quý vị."
    },
    {
      "question": "Thời điểm tiêm mũi thứ hai?",
      "answer":
          "Quý vị nên tiêm mũi thứ hai sát nhất có thể với thời khoảng khuyến nghị 3 tuần hoặc 4 tuần. Quý vị không nên tiêm mũi thứ hai sớm. Tuy nhiên, nếu quý vị được tiêm vắc-xin COVID-19 liều thứ hai tối đa 4 ngày trước hoặc bất kỳ lúc nào sau ngày được khuyến nghị, quý vị không cần bắt đầu lại loạt vắc-xin và quý vị có thể được coi là đã tiêm vắc-xin đầy đủ."
    },
    {
      "question":
          "Nếu rôi đang mang thai hoặc có ý định mang thai thì có nên tiêm chủng vắc-xin Covid-19 không?",
      "answer":
          "Có. Khuyến cáo tiêm chủng vắc-xin ngừa COVID-19 dành cho những người đang mang thai, nuôi con bằng sữa mẹ, đang muốn có thai hoặc có thể mang thai trong tương lai. Quý vị nên trao đổi với nhà cung cấp dịch vụ chăm sóc sức khỏe về tiêm chủng COVID-19. Dù việc trao đổi như vậy có thể có ích, nhưng việc này không phải là bắt buộc trước khi thực hiện tiêm chủng."
    },
    {
      "question":
          "Hàng rào bảo vệ của vắc-xin ngừa COVID-19 có thể kéo dài bao lâu",
      "answer":
          "Các nhà khoa học đang tiếp tục giám sát thời gian mà vắc-xin ngừa COVID-19 có thể bảo vệ người tiêm. Các nghiên cứu gần đây cho thấy khả năng bảo vệ chống lại vi-rút có thể giảm dần theo thời gian. Tình trạng giảm khả năng bảo vệ này đã khiến CDC khuyến nghị tất cả mọi người từ 12 tuổi trở lên nên tiêm nhắc lại sau khi hoàn thành loạt tiêm chủng ban đầu. Những người đã tiêm vắc-xin ngừa COVID-19 của Pfizer-BioNTech hoặc Moderna trong loạt vắc-xin ban đầu nên tiêm nhắc sau ít nhất 5 tháng kể từ khi hoàn thành loạt ban đầu. Những người đã tiêm vắc-xin ngừa COVID-19 của Johnson & Johnson's Janssen nên tiêm nhắc sau ít nhất 2 tháng kể từ khi hoàn thành mũi đầu tiên."
    },
    {
      "question":
          "Làm thế nào để tôi có thể nhận được thẻ tiêm chủng ngừa COVID-19",
      "answer":
          "Nếu quý vị cần thẻ tiêm chủng mới, hãy liên hệ đến cơ sở nhà cung cấp tiêm chủng nơi quý vị tiêm vắc-xin. Nhà cung cấp nên đưa cho quý vị thẻ mới cùng với thông tin cập nhật về tiêm chủng mà quý vị đã được tiêm. Nếu địa điểm nơi quý vị đã tiêm vắc-xin ngừa COVID-19 không hoạt động nữa, hãy liên hệ với hệ thống thông tin chủng ngừa (IIS) tại tiểu bang hoặc sở y tế địa phương của quý vị để được hỗ trợ."
    },
    {
      "question":
          "Tôi có thể tiêm chủng ngừa COVID-19 khi đang bị bệnh vì COVID-19 không?",
      "answer":
          "Không. Những người nhiễm COVID-19 có các triệu chứng nên chờ được tiêm chủng cho đến khi họ khỏi bệnh và đáp ứng các tiêu chí để ngừng cô lập; những người không có các triệu chứng cũng nên chờ cho đến khi họ đáp ứng các tiêu chí trước khi được tiêm chủng. Hướng dẫn này cũng áp dụng với những người nhiễm COVID-19 trước khi tiêm liều vắc-xin thứ hai. Những người được xác định đã bị phơi nhiễm với COVID-19​​​​​​​ không nên đi tiêm chủng cho đến khi thời gian cách ly của họ kết thúc để tránh khả năng làm cho nhân viên y tế và những người khác bị phơi nhiễm trong quá trình tiêm chủng. Khuyến cáo này cũng áp dụng cho những người được xác định bị phơi nhiễm với COVID-19 đã nhận liều vắc-xin mRNA đầu tiên nhưng chưa tiêm liều thứ hai."
    },
  ];
}
