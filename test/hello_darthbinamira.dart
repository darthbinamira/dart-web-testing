@TestOn("vm")

import 'package:test/test.dart';
import 'package:webdriver/io.dart';

void main() {
  group('home page', () {
    WebDriver driver;

    setUpAll(() async {
      driver = await createDriver(
        uri: Uri.parse('http://localhost:4444/wd/hub/'),
        desired: Capabilities.chrome);
    });

    tearDownAll(() async {
      await driver.quit();
    });

    test('index', () async {
      await driver.get('https://darthbinamira.com');
    });

    test('title', () async {
      var element = await driver.findElement(const By.tagName('title'));
      expect(await element.attributes['text'], 'Darth Binamira');
    });

    test('header', () async {
      var element = await driver.findElement(const By.className('site-title'));
      expect(await element.attributes['text'], 'Darth Binamira');
    });

    test('hello, flutter!', () async {
      var element = await driver.findElement(const By.linkText('Hello, Flutter!'));
      expect(await element.attributes['href'], 'https://darthbinamira.com/blog/2018/05/02/hello-flutter/index.html');
    });

    test('about link', () async {
      var element = await driver.findElement(const By.linkText('About'));
      expect(await element.attributes['href'], 'https://darthbinamira.com/about/index.html');
    });
  });
}
