For English refer to [Docs](../../)

# مُقدمة

هذا هو مثال لبناء برنامج C++ علي [Hydra](https://nixos.wiki/wiki/Hydra) (تُنطق هَيدرا) (لا نستخدم أدوات GNU لإبقاء المثال بسيطاً).

# كيفية إضافة هذا المشروع (أو نسخة منه) لهيدرا

## التثبيت

1. قم بزيارة لوحة التحكم الخاصة بك, عادتاً علي هذا العنوان: http://localhost:3000
2. قم بالضغط علي Create project <- Admin (إفتراضاً بأنك قمت بعمل حساب مدير و قمت بتسجيل الدخول أيضاً, إن لم يكن هذا صحيحاً فقم باتباع
   شرح [التثبيت و الإعداد](https://github.com/NixOS/hydra?tab=readme-ov-file#installation-and-setup) الخاص بهيدرا

## إضافة مشروع

<details>
<summary>خطوات إضافة المشروع</summary>

**إقرأ الآتي من اليسار لليمين**

1. Identifier (المُعرف): Nix-Django (أو أي شئ تريده و لكن يجب أن يكون فريداً ولا يشبه أسماء أي مشاريع سابقة علي هيدرا)
2. Display name (الإسم الذي سيظهر لك): Nix-Django
3. Description (الوصف): مثال لجانجو.
4. Homepage (صفحة المشروع) GitHub يمكن لهذا أن يكون صفحة الوثائق أو صفحة المشروع علي: https://github.com/Al-Ghoul/Nix-Django
5. Create project (قم بالضغط عليه و تجاهل أي شئ أخر)

Declartive spec و inputالــ <br>
(سأقوم بتوفير مثال لاحقاً) JSON موجودين لإمكانية إمداد هيدرا بجميع المعلومات عن المشروع في شكل

</details>

## إضافة (مجموعة) الوظائف

بعدما تضف مشروعك، إذهب لصفحة الفهرس الخاصة بهيدرا, ستجد مشاريعك هناك في قائمة الفهرس.

<details>
<summary>خطوات إدخال الوظيفة</summary>

1. إضغط علي Create jobset <- actions
2. Identifier (المُعرف): Nix-Django-Build
3. Type (النوع): Legacy
4. Description (الوصف): .Nix-Django's build jobset
5. Nix expression (ملف نيكس الذي سيقوم ببناء المشروع): release.nix _in_ siteSrc
6. Check interval (الفاصل الزمني للتحقق من المشروع): 60
7. Scheduling shares: 1<br>

</details>

<details>

<summary>خطوات المدخلات التبعية</summary>

تجاهل باقي المدخلات و قم بالنزول لأسفل الصفحة

1. إضغط علي Add a new input:
    - input name (إسم المُدخل) [release.nix](https://github.com/Al-Ghoul/Nix-Django/blob/main/release.nix#L2) يتم تمرير هذا المُدخل للملف: siteSrc
    - Type (النوع): Git checkout
    - Value (القيمة) بلا علامات تنصيص: "https://github.com/Al-Ghoul/Nix-Django main" <br>
      (أو قم بإضافة رابط مشروعك) <br>
      'main' إن كنت تتسائل لما هناك كلمة <br>
      'master' الحقيقة أن هيدرا تقوم بالبحث عن تفرُع <br>
      'main' و نحن لدينا تفرُع واحد و هو <br>
      'main' وبهذه الطريقة هيدرا تقوم بالبحث في
2. قم بإضافة مدخل آخر:
    - input: nixpkgs
    - Type: Git checkout
    - Value: "https://github.com/nixos/nixpkgs nixos-23.11" <br>
      master تقوم بتبديل nixos-23.11 مرة أخري بلا علامات تنصيص و هنا

</details>

# مراجع

[NixOS Hydra's Manual](https://hydra.nixos.org/build/196107287/download/1/hydra/introduction.html) <br>
[NixOS Hydra's Official Repo](https://github.com/NixOS/hydra) <br>
[NixOS Hydra's Wiki](https://nixos.wiki/wiki/Hydra)
