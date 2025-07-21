# 📘 Proje Dokümantasyonu

## 🏷️ Proje Adı

**Dating App**  
> (Projenin Adı) => Pdfte başta gördüğüm için bu şekilde yapmıştım.

---

## 📱 Uygulama Adı

**Sin Flix**  
> Modern, şık ve kullanıcı dostu bir film keşif uygulaması.
---

## 📝 Proje Özeti

Bu proje, kullanıcıların filmleri keşfedebileceği, detaylarını inceleyebileceği ve favorilerine ekleyebileceği modern bir film listeleme uygulamasıdır. Flutter ile geliştirilen uygulama, kullanıcı dostu bir arayüz sunar. Kullanıcılar film detaylarını görüntüleyebilir, favori listesi oluşturabilir. Projede verilen api altyapısı kullanılarak kullanıcı kimlik doğrulama, veritabanı yönetimi ve medya saklama gibi işlemler gerçekleştirilmiştir.

---

## 🎯 Amaç ve Hedefler

- Modern bir Flutter uygulaması geliştirmek
- BLoC mimarisi ile temiz ve test edilebilir bir yapı kurmak
- Responsive ve erişilebilir bir UI tasarımı oluşturmak
- Çoklu dil desteğiyle uluslararasılaştırma (i18n) örneği sunmak
- Theme yönetimi yapmak
- SOLİD prensiplere uymak
- ANlaşılabilir ve temiz kod yazmak

---

## ⚙️ Kullanılan Teknolojiler

| Teknoloji               | Açıklama                                                                 |
|-------------------------|--------------------------------------------------------------------------|
| Flutter                 | UI geliştirme framework'ü                                                |
| Dart                    | Programlama dili                                                         |
| BLoC (flutter_bloc)     | State yönetimi ve veri akışı kontrolü                                    |
| Easy Localization       | Çoklu dil desteği (i18n)                                                 |
| go_router               | Sayfalar arası yönlendirme ve route yönetimi                             |
| flutter_dotenv          | Ortam değişkenlerini `.env` dosyası ile yönetme                         |
| Dio                     | REST API üzerinden veri çekme ve gönderme işlemleri                      |
| Logger                  | Uygulama içi loglama ve hata takibi                                      |
| Flutter Secure Storage  | Token gibi hassas verilerin güvenli saklanması                          |
| image_picker            | Kullanıcıdan fotoğraf seçme (galeri/kamera)                             |
| shimmer                 | Veri yüklenirken kullanılan shimmer animasyonu                          |
| flutter_native_splash   | Özelleştirilmiş açılış ekranı (splash screen)                            |
| flutter_launcher_icons  | Uygulama ikonu (launcher icon) oluşturma                                |
| font_awesome_flutter    | FontAwesome ikonlarının kullanımı                                        |
| firebase_core           | Firebase servislerini entegre etmek için temel yapı                     |
| firebase_analytics ⚠️  | (Opsiyonel) Kullanıcı davranışlarını izlemek için hazır, entegre edilmedi |
| firebase_crashlytics ⚠️| (Opsiyonel) Hata takibi ve crash raporları için hazır, entegre edilmedi  |


---

## 📁 Proje Yapısı

lib/
├── core/
│ ├── config/
│ └── constants/
│ └── extensions/
│ └── state_management/ => Bu kısım normalde ayarlarda olmalı dil ve theme statei 
├── data/
│ ├── models/ => Veri modelleri
│ └── repository/ => Servis ve state yönetimi
│ └── service/ => Api ve cache bağlantıları
├── presentation/
│ ├── components/ => Genel componentler (widgets animations vs.)
│ └── pages/ => Modüller halinde sayfalar
├── resources/
│ ├── assets/ => Resimler,fontlar
│ └── translations/ => Dil çevirileri
├── utils/ => Projede birçok yerde kullanılan fonksiyonlar
├── app.dart => MaterialApp yapılanması
├── main.dart => Main dosyası
├── firebase_options.dart => Firebase config
.env => Api Base Url gibi değişkenlerin bulunduğu kısım (github pushunda eklemesin diye)

---

## 📱 Özellikler

- ✅ Kullanıcı kaydı ve giriş sistemi (Api Üzerinden)
- ✅ Token Yönetimi
- ✅ Profil oluşturma ve düzenleme
- ✅ Fotoğraf yükleme 
- ✅ Gerçek zamanlı veri güncelleme (Bloc,dio)
- ✅ Çoklu dil desteği (tr, en)
- ✅ Modern UI ve animasyonlar
- ✅ Responsive tasarım
- ✅ Temiz ve geliştirilebilir mimari yapı
- ✅ Logger ile hata izleme

---

## 🧱 Mimari Yaklaşım

Proje, katmanlı bir yapı ile Clean Architecture prensibine uygun şekilde geliştirildi:

- **Core**: Temel ayarlar, temalar, initalize işlemleri, sabitler
- **Presentation**: Her bir özelliğin bağımsız modül olarak konumlandığı alan
- **Components/Widgets**: Tekrar kullanılabilir bileşenler
- **State/Bloc**: Tüm state yönetim süreçleri buradan kontrol edilir

---

## 🧪 Testler

Bu proje için henüz kapsamlı bir `unit` veya `widget` testi yazılmamıştır.  
Ancak geliştirme sürecinde işlevsellik ve akışların doğruluğu aşağıdaki yollarla test edilmiştir:

- ✅ `logger`, `print` ve `debugPrint` kullanılarak servis çağrıları ve BLoC akışları manuel olarak doğrulandı.
- ✅ Sayfa geçişleri (`go_router`) ve kullanıcı etkileşimleri cihaz üzerinde test edildi.
- ✅ Dio ile yapılan API isteklerinin cevapları konsol çıktıları ile analiz edildi.
- ❌ Unit test henüz yazılmadı.
- ❌ Widget test henüz uygulanmadı.

> 📌 Not: Proje mimarisi, test yazılabilir olacak şekilde yapılandırılmıştır.


---

## 🚀 Kurulum ve Çalıştırma

```bash
# Gerekli paketleri yükle
flutter pub get

# Uygulamayı başlat
flutter run
```

---

## 👤 Yapımcı / Geliştirici

**Ad Soyad:** Ahmet Özer  
**E-posta:** ahmetozeratu@gmail.com  
**Telefon:** +905511893669
**GitHub:** [github.com/ahmetozer27](https://github.com/ahmetozer27)    

> Proje ile ilgili sorularınız veya iş birliği için yukarıdaki iletişim kanallarından bana ulaşabilirsiniz.
