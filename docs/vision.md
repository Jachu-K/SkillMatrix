# Wizja projektu — SkillMatrix

## Problem

Osoba szukająca pracy (student, junior, ktoś zmieniający branżę) nie wie, jak jej faktyczne umiejętności mają się do wymagań rynku. CV opisuje umiejętności ogólnikowo („znajomość C”), oferty na różnych portalach opisują wymagania każda po swojemu, a porównanie jednego z drugim robi się ręcznie, ofertę po ofercie. W efekcie kandydat:

- aplikuje na oferty, do których nie pasuje, albo pomija te, do których pasuje,
- nie wie, której umiejętności się nauczyć, żeby realnie zwiększyć liczbę dostępnych ofert,
- nie potrafi ocenić, czy jego CV dobrze pokazuje to, co umie.

## Użytkownicy

- **Kandydat** — chce wiedzieć, na jakim poziomie są jego umiejętności, do jakich ofert pasuje i czego mu brakuje. To jedyny człowiek korzystający z systemu.

Pozostali uczestnicy (nie-ludzie):

- **Agent ofert** — automatycznie zbiera oferty pracy z zewnętrznych portali.
- **Agent AI** — ocenia poziom umiejętności kandydata, zamienia treść ofert na umiejętności z grafu, ocenia i generuje CV; pełni też rolę administratora grafu umiejętności (korzysta z zewnętrznego modelu językowego).
- **GitHub** — źródło danych o projektach kandydata.

Rekruterzy ani administrator-człowiek nie korzystają z systemu — oferty trafiają do niego wyłącznie przez agenta ofert, a graf umiejętności utrzymuje Agent AI.

## Wizja

Kandydat wrzuca to, co ma — oceny, CV, link do GitHuba — i dostaje mierzalny obraz swoich umiejętności: graf atomowych umiejętności z poziomem 0–1 każda, który w całości szacuje AI (np. widząc ocenę 5 z programowania w C, może uznać, że „programowanie w C” to co najmniej 0.8). Kandydat domyślnie widzi poziomy opisowo (od „początkujący” do „ekspert”); jeśli bardzo chce, może włączyć widok liczbowy i ręcznie poprawić ocenę AI, choć nie jest to zalecane. Oferty z rynku są opisane tym samym grafem, więc kandydat widzi, które do niego pasują i w jakim stopniu, oraz jakie braki dzielą go od kolejnych. Zamiast zgadywać, czego się uczyć, dostaje listę umiejętności, które odblokowują najwięcej ofert.

## Najważniejsze możliwości

1. Budowanie grafu umiejętności kandydata z poziomami 0–1 oszacowanymi przez AI na podstawie dostarczonych materiałów.
2. Import danych z GitHuba — z całego profilu oraz z pojedynczych repozytoriów.
3. Automatyczne pobieranie ofert pracy z zewnętrznych portali i opisywanie ich wymagań umiejętnościami z grafu.
4. Porównanie profilu z wymaganiami ofert i wskazanie najlepiej dopasowanych.
5. Rekomendacje nauki: które brakujące umiejętności odblokowują najwięcej ofert.
6. Ocena istniejącego CV oraz generowanie CV z grafu umiejętności.

## Zakres

**W zakresie:** profil umiejętności kandydata, pobieranie ofert z wybranych portali, dopasowanie i rekomendacje, ocena/generowanie CV, import z GitHuba.

**Poza zakresem:** aplikowanie na oferty i kontakt z pracodawcą, konta dla rekruterów i administratorów, kursy i materiały do nauki, weryfikacja prawdziwości dostarczonych dokumentów.
