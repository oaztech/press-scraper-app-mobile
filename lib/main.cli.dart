import 'package:scrapi/client/hespress_scraper.client.dart';

void main() async {
  HespressScraperClient.fetchBrefArticles(categorySlug: "politique").then((resp) => {print(resp.count)});
}
