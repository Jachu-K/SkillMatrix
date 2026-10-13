# SkillMatrix

## Opis

SkillMatrix przechowuje umiejętności użytkownika jako graf atomowych umiejętności ocenianych w skali 0–1, a poziom każdej z nich szacuje model AI na podstawie dostarczonych materiałów (oceny, CV, profil i repozytoria GitHub). Agent zbierający oferty pobiera ogłoszenia z zewnętrznych portali pracy i zamienia ich wymagania na ten sam graf umiejętności, dzięki czemu system wskazuje najlepiej dopasowane oferty oraz podpowiada, których umiejętności warto się nauczyć, aby odblokować najwięcej nowych ofert. Dodatkowo potrafi ocenić istniejące CV lub wygenerować nowe na podstawie grafu umiejętności.

## Agenci systemu

| Agent | Rola |
|---|---|
| **Kandydat** (człowiek) | Jedyny człowiek w systemie. Dostarcza materiały (CV, oceny, link do GitHuba), przegląda swój graf umiejętności, dopasowane oferty, rekomendacje nauki i ocenę CV. |
| **Serwer SkillMatrix** | Przechowuje konta, profile, oferty i graf umiejętności, liczy dopasowanie i rekomendacje, pośredniczy w komunikacji między agentami. |
| **Agent ofert** (nasz program) | Według harmonogramu pobiera ogłoszenia z portali z pracą, usuwa duplikaty i przekazuje je do serwera. |
| **Agent AI** (nasz program) | „Mózg” systemu: ocenia umiejętności kandydata, zamienia treść ofert na umiejętności z grafu, ocenia i generuje CV. Pełni też rolę administratora grafu — dodaje węzły, scala duplikaty, wyznacza relacje. Korzysta z zewnętrznego modelu językowego (LLM). |
| **Model językowy (LLM)** (system zewnętrzny) | Np. Claude API — dostaje tekst z instrukcją, zwraca odpowiedź w ustalonym formacie JSON. Używa go wyłącznie Agent AI. |
| **GitHub API** (system zewnętrzny) | Udostępnia dane profilu i repozytoriów kandydata. |
| **Portale z ofertami pracy** (systemy zewnętrzne) | Źródło ogłoszeń pobieranych przez agenta ofert. |

## Zespół

- Jan Kaszycki
- Aleksandr Kuraskin

## Dokumentacja

- [Wizja projektu](docs/vision.md)
- [Historie użytkownika](docs/user-stories.md)
- [Przypadki użycia](docs/use-cases/README.md) — diagramy wg modułów i opisy wg schematu Cockburna
- [Diagramy klas](docs/architecture/README.md) — moduły, serwisy komunikacji i kluczowe klasy
- [Prezentacja](presentation/slides.pdf) ([źródło LaTeX](presentation/slides.tex))

Diagramy są w PlantUML ([`docs/diagrams/`](docs/diagrams/)). Przebudowanie diagramów i prezentacji: `make` (wymaga `plantuml` i `pdflatex`).
