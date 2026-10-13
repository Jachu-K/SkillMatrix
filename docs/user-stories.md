# Historie użytkownika — SkillMatrix

Format: **Jako** _rola_ **chcę** _cel_, **aby** _powód biznesowy_.
Priorytet: **M** — musi być (MVP), **S** — powinno być, **C** — może być.
Kolumna **UC** wskazuje przypadki użycia realizujące daną historię ([przypadki użycia](use-cases/README.md)).

Historie oznaczone ★ mają rozpisany rewers karty (kryteria akceptacji) na końcu dokumentu; przebieg części z nich jest też opisany w tabelach przypadków użycia w [use-cases](use-cases/README.md).

## Kandydat

| ID | Historia | Prio | UC |
|---|---|---|---|
| US-01 | Jako kandydat chcę założyć konto i się logować, aby mój profil umiejętności był zapisany i dostępny tylko dla mnie. | M | UC-01, UC-02 |
| US-02 | Jako kandydat chcę wgrać swoje CV, aby system poznał moje doświadczenie bez ręcznego przepisywania. | M | UC-03 |
| US-03 | Jako kandydat chcę wprowadzić oceny z przedmiotów, aby wyniki ze studiów przełożyły się na poziom umiejętności. | M | UC-03 |
| US-04 ★ | Jako kandydat chcę podać link do mojego profilu GitHub lub pojedynczego repozytorium, aby system ocenił umiejętności na podstawie faktycznego kodu. | M | UC-04 |
| US-05 ★ | Jako kandydat chcę, żeby AI oszacowało moje umiejętności w skali 0–1 na podstawie dostarczonych materiałów, aby dostać mierzalny obraz tego, co umiem. | M | UC-05 |
| US-06 | Jako kandydat chcę zobaczyć swój graf umiejętności z poziomem opisowym (Początkujący / Podstawowy / Zaawansowany / Ekspert) i uzasadnieniem każdej oceny, aby rozumieć, co umiem, bez skupiania się na dokładnych liczbach. | M | UC-06 |
| US-07 ★ | Jako kandydat chcę móc (po włączeniu niezalecanej opcji) zobaczyć dokładne wartości 0–1 i ręcznie je poprawić, aby skorygować ocenę AI, z którą się nie zgadzam. | C | UC-07 |
| US-08 ★ | Jako kandydat chcę zobaczyć listę ofert pracy posortowaną według dopasowania, aby aplikować tam, gdzie mam realne szanse. | M | UC-08 |
| US-09 | Jako kandydat chcę zobaczyć dla wybranej oferty, których wymagań nie spełniam i o ile, aby wiedzieć, co dzieli mnie od tej pracy. | M | UC-09 |
| US-10 | Jako kandydat chcę filtrować oferty (lokalizacja, tryb pracy, minimalne dopasowanie), aby nie przeglądać ofert, które mnie nie interesują. | S | UC-08 |
| US-11 ★ | Jako kandydat chcę dostać listę umiejętności, których nauka odblokuje najwięcej ofert, aby inwestować czas w naukę tam, gdzie się to najbardziej opłaca. | M | UC-10 |
| US-12 | Jako kandydat chcę wskazać docelową ofertę i dostać rekomendacje pod nią, aby przygotować się do konkretnej rekrutacji. | C | UC-10 |
| US-13 | Jako kandydat chcę otrzymać ocenę mojego CV wraz z listą poprawek, aby lepiej pokazać to, co umiem. | S | UC-11 |
| US-14 | Jako kandydat chcę wygenerować CV na podstawie mojego grafu umiejętności (ogólne lub pod konkretną ofertę), aby szybko mieć dokument gotowy do wysłania. | S | UC-12 |
| US-15 | Jako kandydat chcę usunąć konto wraz ze wszystkimi materiałami, aby mieć kontrolę nad swoimi danymi. | S | UC-13 |

## Agent AI (aktor systemowy — pełni rolę administratora grafu)

W systemie nie ma administratora-człowieka. Graf umiejętności buduje i utrzymuje Agent AI.

| ID | Historia | Prio | UC |
|---|---|---|---|
| US-20 ★ | Jako agent AI chcę zamieniać treść ogłoszenia na listę wymaganych umiejętności z grafu (z minimalnym poziomem i informacją, czy są obowiązkowe), aby oferty dało się porównać z profilami. | M | UC-31 |
| US-21 ★ | Jako agent AI chcę przed dodaniem nowej umiejętności sprawdzić, czy nie istnieje już pod inną nazwą (synonim, skrót, inna pisownia), aby w grafie nie powstawały duplikaty. | M | UC-23 |
| US-22 | Jako agent AI chcę dodawać nowe umiejętności jako tymczasowe i zatwierdzać je dopiero po wystąpieniu w kilku ofertach, aby jednorazowe pomyłki nie zaśmiecały grafu. | S | UC-20 |
| US-23 | Jako agent AI chcę okresowo wyszukiwać i scalać zduplikowane umiejętności, aby naprawić duplikaty, które przeszły przy dodawaniu. | S | UC-21 |
| US-24 | Jako agent AI chcę wyznaczać relacje między umiejętnościami (np. „C++ ≥ 0.8 implikuje C ≥ 0.6”), aby system mógł wnioskować o umiejętnościach pokrewnych. | S | UC-22 |
| US-25 | Jako agent AI chcę zapisywać każdą zmianę grafu z uzasadnieniem, aby błędną zmianę dało się prześledzić i cofnąć. | S | UC-20, UC-21 |

## Agent ofert (aktor systemowy)

| ID | Historia | Prio | UC |
|---|---|---|---|
| US-30 ★ | Jako agent ofert chcę cyklicznie pobierać nowe ogłoszenia z każdego portalu z konfiguracji, aby baza ofert była aktualna bez udziału człowieka. | M | UC-30 |
| US-31 | Jako agent ofert chcę rozpoznawać duplikaty tej samej oferty z różnych portali, aby kandydat nie widział jej kilka razy. | S | UC-30 |
| US-32 | Jako agent ofert chcę oznaczać oferty, które zniknęły z portalu, jako nieaktualne, aby kandydat nie dostawał wygasłych ofert. | S | UC-32 |

---

## Rewersy kart (kryteria akceptacji)

### US-04 — Import z GitHuba
- Podanie linku `github.com/<login>` importuje wszystkie publiczne repozytoria niebędące forkami.
- Podanie linku `github.com/<login>/<repo>` importuje tylko to repozytorium.
- Dla każdego repozytorium zapisywane są: języki (z udziałem procentowym), README, liczba commitów autora, data ostatniej zmiany.
- Link do nieistniejącego lub prywatnego zasobu kończy się komunikatem błędu, a profil kandydata pozostaje bez zmian.
- Ponowny import tego samego linku aktualizuje dane, nie tworzy duplikatu materiału.

### US-05 — Ocena umiejętności przez AI
- Po ocenie każda rozpoznana umiejętność ma poziom z przedziału [0, 1], pewność (confidence) i tekstowe uzasadnienie z odwołaniem do materiału.
- Oceny z przedmiotów interpretuje AI (bez sztywnych reguł przeliczania) — uzasadnienie wskazuje, które oceny wpłynęły na poziom.
- Każda nazwa umiejętności zwrócona przez AI jest mapowana na węzeł grafu (UC-23) — profil nie zawiera umiejętności spoza grafu.
- Niedostępność AI kończy się komunikatem „spróbuj później”; poprzedni profil pozostaje bez zmian.

### US-07 — Ręczna korekta poziomu
- Domyślnie poziomy są pokazywane opisowo (4 przedziały); liczby i edycja są dostępne dopiero po włączeniu opcji w ustawieniach.
- Przy włączaniu opcji i przy każdej zmianie system pokazuje ostrzeżenie, że korekta nie jest zalecana i może pogorszyć trafność dopasowań.
- Poprawiony poziom jest oznaczony jako „zmieniony ręcznie” i obok widać wartość oszacowaną przez AI.
- Kolejna ocena AI nie nadpisuje ręcznej korekty; kandydat może ją w każdej chwili cofnąć do wartości AI.

### US-08 — Lista dopasowanych ofert
- Lista zawiera tylko oferty aktywne.
- Każda oferta ma wynik dopasowania w procentach; lista jest posortowana malejąco po tym wyniku.
- Oferta, której wymaganie obowiązkowe jest niespełnione, ma oznaczenie „brakuje wymagań obowiązkowych”.
- Dla kandydata bez ocenionego profilu wyświetla się zachęta do dodania materiałów zamiast pustej listy.

### US-11 — Rekomendacje nauki
- Rekomendacja zawiera: umiejętność, docelowy poziom oraz liczbę ofert, które staną się dopasowane po jego osiągnięciu.
- Lista jest posortowana malejąco po liczbie odblokowanych ofert.
- Nie rekomenduje się umiejętności, w których kandydat już spełnia wymagany poziom.
- Rekomendacje są przeliczane po każdej zmianie profilu lub zbioru aktywnych ofert.

### US-20 — Zamiana oferty na wymagania
- Każde wymaganie oferty wskazuje istniejący węzeł grafu, minimalny poziom 0–1 i flagę „obowiązkowe / mile widziane”.
- Ta sama treść ogłoszenia przetworzona dwukrotnie daje ten sam zbiór umiejętności (deterministyczne ustawienia modelu).
- Oferta, z której nie udało się wyodrębnić żadnego wymagania, jest zapisywana, ale nie bierze udziału w dopasowaniu.

### US-21 — Brak duplikatów w grafie
- Nazwy różniące się tylko wielkością liter, spacjami, myślnikami lub numerem wersji („ReactJS”, „React.js”, „React 18”) trafiają do tego samego węzła.
- Znane skróty i synonimy („JS” / „JavaScript”, „k8s” / „Kubernetes”) są zapisywane jako aliasy, nie jako nowe węzły.
- Nowy węzeł powstaje tylko wtedy, gdy żaden istniejący nie jest wystarczająco podobny, a decyzja jest zapisana z uzasadnieniem.

### US-30 — Cykliczne pobieranie ofert
- Agent uruchamia się zgodnie z harmonogramem ustawionym dla każdego portalu w pliku konfiguracyjnym.
- Oferta o tym samym identyfikatorze zewnętrznym nie jest zapisywana drugi raz — jest aktualizowana.
- Błąd jednego portalu nie przerywa pobierania z pozostałych; jest zapisywany w historii przebiegów.
- Każda zapisana oferta ma link do źródła i datę pobrania.
