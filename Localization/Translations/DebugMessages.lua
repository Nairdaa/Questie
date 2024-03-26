---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

local debugMessagesLocales = {
    ["Questie Commands"] = {
        ["ptBR"] = "Comandos do Questie",
        ["ruRU"] = "Команды Questie:",
        ["deDE"] = "Questie-Befehle",
        ["koKR"] = "Questie 명령어",
        ["esMX"] = "Comandos de Questie",
        ["enUS"] = true,
        ["zhCN"] = "Questie配置命令",
        ["zhTW"] = "Questie 指令",
        ["esES"] = "Comandos de Questie",
        ["frFR"] = "Commandes de Questie",
    },
    ["Toggles the Config window"] = {
        ["ptBR"] = "Mostrar / Ocultar a janela de configurações",
        ["ruRU"] = "показать/скрыть окно настроек.",
        ["deDE"] = "Zeigen/Verstecken des Einstellungsfensters",
        ["koKR"] = "설정 창을 엽니다",
        ["esMX"] = "Muestra la ventana de configuración",
        ["enUS"] = true,
        ["zhCN"] = "打开设置窗口",
        ["zhTW"] = "切換顯示設定選項",
        ["esES"] = "Muestra la ventana de configuración",
        ["frFR"] = "Ouvre le panneau de configuration.",
    },
    ["Toggles showing questie on the map and minimap"] = {
        ["ptBR"] = "Mostrar / Ocultar Questie no mapa e minimapa",
        ["ruRU"] = "показать/скрыть значки Questie.",
        ["deDE"] = "Zeigen/Verstecken von Questie auf der Weltkarte und Minimap",
        ["koKR"] = "맵과 미니맵에 퀘스티 아이콘을 표시합니다",
        ["esMX"] = "Muestra Questie en el mapa y minimapa",
        ["enUS"] = true,
        ["zhCN"] = "在地图上显示Questie提示",
        ["zhTW"] = "在大地圖和小地圖上顯示任務圖示",
        ["esES"] = "Muestra Questie en el mapa y minimapa",
        ["frFR"] = "Active ou désactive l'affichage de Questie sur la carte et la minicarte",
    },
    ["Toggles the My Journey window"] = {
        ["ptBR"] = "Mostrar / Ocultar a janela Minha Jornada",
        ["ruRU"] = "открыть 'Путешествие'.",
        ["deDE"] = "Zeigen/Verstecken des 'Meine Reise'-Fensters",
        ["koKR"] = "나의 여정 창을 표시합니다",
        ["esMX"] = "Muestra la ventana de 'Mi Viaje'",
        ["enUS"] = true,
        ["zhCN"] = "打开日志窗口",
        ["zhTW"] = "打開冒險日記",
        ["esES"] = "Muestra la ventana de 'Mi Viaje'",
        ["frFR"] = "Ouvre la fenêtre Mon voyage.",
    },
    ["Toggles the Tracker. Add 'show', 'hide', 'reset' to explicit show/hide or reset the Tracker"] = {
        ["ptBR"] = "Mostrar / Ocultar o rastreador de missões. Utilizar 'show', 'hide', 'reset' para respectivamente mostrar, ocultar ou redefinir o rastreador.",
        ["ruRU"] = "состояние трекера Questie. Добавьте 'show', 'hide', 'reset', чтобы показать, скрыть или сбросить трекер.",
        ["deDE"] = "Zeigen/Verstecken des Questie Trackers. Bei 'show', 'hide' oder 'reset' wird der Tracker explizit gezeigt, versteckt oder zurückgesetzt",
        ["koKR"] = "추적기를 표시합니다. 'show','hide','reset'을 설정하여 추적기를 설정합니다.",
        ["esMX"] = "Muestra el Rastreador. Agrega 'mostrar', 'ocultar y 'restablecer' para mostrar/ocultar y restablecer el Rastreador",
        ["enUS"] = true,
        ["zhCN"] = "切换任务追踪窗口，输入  'show', 'hide', 'reset' 选项以显示、隐藏、重设追踪窗口",
        ["zhTW"] = "切換顯示追蹤清單。加上 'show', 'hide', 'reset' 選項來顯示、隱藏、重置追蹤清單",
        ["esES"] = "Muestra el Rastreador. Agrega 'mostrar', 'ocultar y 'restablecer' para mostrar/ocultar y restablecer el Rastreador",
        ["frFR"] = "Active / désactive le traqueur. Ajouter 'afficher', 'cacher', 'réinitialiser' pour afficher / cacher ou réinitialiser explicitement le traqueur",
    },
    ["Flex the amount of quests you have completed so far"] = {
        ["ptBR"] = "Mostra a quantidade de missões que você completou até agora",
        ["ruRU"] = "похвастаться количеством выполненных вами заданий.",
        ["deDE"] = "Gib mit der Anzahl an Quests an die du bisher abgeschlossen hast",
        ["koKR"] = "지금까지 완료한 퀘스트의 수를 표시합니다",
        ["esMX"] = "Mostrar la cantidad de misiones que has completado hasta ahora",
        ["enUS"] = true,
        ["zhCN"] = "调整目前为止你完成的任务数量",
        ["zhTW"] = "調整到目前為止你已完成的任務數量",
        ["esES"] = "Mostrar la cantidad de misiones que has completado hasta ahora",
        ["frFR"] = "Frimer avec le nombre de quêtes réalisées jusqu’à présent",
    },
    ["has completed a total of %d quests"] = {
        ["ptBR"] = "completou um total de %d missões",
        ["ruRU"] = "всего выполнено заданий - %d",
        ["deDE"] = "hat insgesamt %d Quests abgeschlossen",
        ["koKR"] = "지금까지 %d 의 퀘스트를 완수하였습니다",
        ["esMX"] = "ha completado un total de %d misiones",
        ["enUS"] = true,
        ["zhCN"] = "总共完成了 %d 个任务",
        ["zhTW"] = "總共完成了 %d 個任務",
        ["esES"] = "ha completado un total de %d misiones",
        ["frFR"] = "a complété un total de %d quêtes",
    },
    ["Toggles the Minimap Button for Questie"] = {
        ["ptBR"] = "Mostrar / Ocultar o botão do Questie no minimapa",
        ["ruRU"] = "показать/скрыть кнопку у миникарты.",
        ["deDE"] = "Zeigen/Verstecken des Minimap-Buttons für Questie",
        ["koKR"] = "Questie 미니맵 아이콘을 표시합니다",
        ["esMX"] = "Muestra el botón del minimapa para Questie",
        ["enUS"] = true,
        ["zhCN"] = "切换显示或隐藏Questie小地图图标",
        ["zhTW"] = "顯示小地圖按鈕",
        ["esES"] = "Muestra el botón del minimapa para Questie",
        ["frFR"] = "Affiche ou désactive le bouton Questie autour de la minicarte.",
    },
    ["Adds manual notes to the map for a given NPC ID or name. If the name is ambiguous multipe notes might be added. Without a second command the target will be added to the map. The 'reset' command removes all notes"] = {
        ["ptBR"] = "Adiciona notas manuais ao mapa para um determinado NPC ID ou nome. Se o nome for ambíguo, podem ser adicionadas notas multipe. Sem um segundo comando, o alvo será adicionado ao mapa. O comando 'redefinir' remove todas as notas",
        ["ruRU"] = "добавить ручные заметки на карту для введенного ID (или имени) NPC. Если имя неоднозначное, то могут добавиться несколько заметок. Без второй команды цель будет добавлена на карту. Команда 'reset' удаляет все заметки.",
        ["deDE"] = "Fügt manuelle Notizen für die NPC-ID oder den NPC-Namen zur Karte hinzu. Ist der Name nicht eindeutig, können mehrere Notizen hinzugefügt werden. Ohne einen zweiten Befehl wird das aktuelle Ziel zur Karte hinzugefügt. Mit dem 'reset' Befehl werden alle Notizen wieder entfernt",
        ["koKR"] = "지도에 NPC ID or 이름에 대한 메모를 추가합니다. 이름이 정확하지 않은 경우에 다수의 메모를 추가 할 수 있습니다. 추가 사항이 없을시, 대상은 지도에 추가됩니다. 'reset'으로 모든 노트를 제거 할 수 있습니다.",
        ["esMX"] = "Agrega notas manuales al mapa para un ID o nombre de PNJ específico. Si el nombre es ambiguo puede que se agreguen varias notas. Sin un segundo comando, el objetivo será agregado al mapa. El comando 'reestablecer' elimina todas las notas.",
        ["enUS"] = true,
        ["zhCN"] = "对特定NPC ID或名称于地图上加上自定义备注。若名字不精准，则备注可能会被加到多个目标上。 'reset'  指令可以移除所有的备注",
        ["zhTW"] = "手動將指定的 NPC ID 或名字加到地圖上。如果名字不夠精確，可能會加入多個目標。沒有第二個指令時，會將目標加到地圖上。'reset' 指令則會移除所有目標。",
        ["esES"] = "Agrega notas manuales al mapa para un ID o nombre de PNJ específico. Si el nombre es ambiguo puede que se agreguen varias notas. Sin un segundo comando, el objetivo será agregado al mapa. El comando 'reestablecer' elimina todas las notas.",
        ["frFR"] = "Ajouter des notes manuellement à la carte pour un ID ou un nom de PNJ donné. Si le nom est ambigu, plusieurs notes peuvent être ajoutées. Sans une deuxième commande, la cible sera ajoutée à la carte. La commande 'réinitialiser' supprime toutes les notes",
    },
    ["Invalid command. For a list of options please type: "] = {
        ["ptBR"] = "Comando inválido. Para uma lista de opções, digite: ",
        ["ruRU"] = "Неверная команда. Для отображения списка команд наберите: ",
        ["deDE"] = "Ungültiger Befehl. Für eine Liste aller verfügbaren Befehle nutze: ",
        ["koKR"] = "존재하지 않는 명령어입니다. 전체 명령어를 확인하시려면 다음과 같이 입력해주세요: ",
        ["esMX"] = "Comando inválido. Para una lista de opciones escribe: ",
        ["enUS"] = true,
        ["zhCN"] = "无效命令，要查看指令列表请输入：",
        ["zhTW"] = "無效的指令，要查看指令列表請輸入: ",
        ["esES"] = "Comando inválido. Para una lista de comandos escribe: ",
        ["frFR"] = "Commande invalide. Pour obtenir une liste d'options, veuillez taper :",
    },
    ["There was a problem initializing Questie's database. This can usually be fixed by recompiling the database."] = {
        ["ptBR"] = "Ocorreu um problema ao inicializar o banco de dados do Questie. Isso geralmente pode ser consertado recompilando o banco de dados.",
        ["ruRU"] = "Выявлена проблема при инициализации базы данных Questie. Обычно это может быть исправлено путем рекомпиляции БД.",
        ["deDE"] = "Es gab ein Problem beim Initialisieren der Questie-Datenbank. Ein Neukompilieren der Datenbank behebt das Problem in der Regel.",
        ["koKR"] = "Questie 정보를 초기화하는동안 문제가 발생했습니다. 일반적으로 정보를 다시 편집하여 수정 할 수 있습니다.",
        ["esMX"] = "Hubo un problema inicializando la base de datos de Questie. Esto generalmente se puede solucionar recompilando la base de datos.",
        ["enUS"] = true,
        ["zhCN"] = "初始化 Questie 的数据库时出现问题。 通常可以通过重新编辑数据库来解决问题。",
        ["zhTW"] = "初始化 Questie 的資料庫時發生問題，通常可以藉由重建資料庫來解決。",
        ["esES"] = "Hubo un problema inicializando la base de datos de Questie. Esto generalmente se puede solucionar recompilando la base de datos.",
        ["frFR"] = "Un problème est survenu lors de l'initialisation de la base de données de Questie. Cela peut généralement être résolu en recompilant la base de données.",
    },
    ["There was an error populating objectives for %s %s %s %s"] = {
        ["ptBR"] = "Ocorreu um erro ao popular objetivos para %s %s %s %s",
        ["ruRU"] = "Ошибка получения целей: %s %s %s %s",
        ["deDE"] = "Es gab einen Fehler beim Weitergeben der Ziele für %s %s %s %s",
        ["koKR"] = "%s %s %s %s 에 대한 목표를 진행하는 동안 오류가 발생했습니다.",
        ["esMX"] = "Se produjo un error al obtener los objetivos para %s %s %s %s",
        ["enUS"] = true,
        ["zhCN"] = "增加 %s %s %s %s 的目标时出错",
        ["zhTW"] = "取得 %s %s %s %s 的任務目標時發生錯誤",
        ["esES"] = "Se produjo un error al obtener los objetivos para %s %s %s %s",
        ["frFR"] = "Une erreur s'est produite lors de la création des objectifs pour %s %s %s %s",
    },
    ["Error: Questie tracker in invalid location, resetting..."] = {
        ["ptBR"] = "Erro: Rastreador do Questie em um local inválido, redefinindo...",
        ["ruRU"] = "Ошибка: трекер Questie в неправильном положении, сброс...",
        ["deDE"] = "Fehler: Der Questie-Tracker ist in einer ungültigen Position und wird zurückgesetzt...",
        ["koKR"] = "에러: Questie 추적기가 허용되지 않은 위치에 있습니다, 재설정 중...",
        ["esMX"] = "Error: Rastreador en ubicación inválida, reiniciado...",
        ["enUS"] = true,
        ["zhCN"] = "错误：Questie任务追踪的框架跑到奇怪的地方去了，重置一下......",
        ["zhTW"] = "錯誤: Questie 的任務追蹤清單跑到奇怪的地方去了，正在重置...",
        ["esES"] = "Error: Rastreador en ubicación inválida, reiniciado...",
        ["frFR"] = "Erreur : suivi des quêtes de Questie dans un endroit non valide, réinitialisation...",
    },
    ["Setting icon limit value to %s : Redrawing!"] = {
        ["ptBR"] = "Definindo o valor limite do ícone como %s : Redesenhar!",
        ["ruRU"] = "Ограничение количества значков: %s. Перерисовка!",
        ["deDE"] = "Icon Limit geändert auf %s : Zeichne neu!",
        ["koKR"] = "아이콘 제한 값을 %s 로 설정하는중 : Redrawing!",
        ["esMX"] = "Establaciendo límite de ícono a %s : Redibujando!",
        ["enUS"] = true,
        ["zhCN"] = "图标限制值设置为 %s : 重新绘制中!",
        ["zhTW"] = "圖示數量限制為 %s : 重新繪製中!",
        ["esES"] = "Establaciendo límite de ícono a %s : Redibujando!",
        ["frFR"] = "Définition de la valeur limite de l'icône sur %s : Redessiner !",
    },
    ["Questie DB has updated!"] = {
        ["ptBR"] = "O banco de dados do Questie foi atualizado!",
        ["ruRU"] = "База данных Questie обновляется!",
        ["deDE"] = "Questie DB wurde aktualisiert!",
        ["koKR"] = "Questie DB가 업데이트되었습니다!",
        ["esMX"] = "¡La base de datos de Questie se ha actualizado!",
        ["enUS"] = true,
        ["zhCN"] = "Questie 数据库已更新!",
        ["zhTW"] = "Questie 資料庫已更新!",
        ["esES"] = "¡La base de datos de Questie se ha actualizado!",
        ["frFR"] = "La base de données Questie a été mise à jour !",
    },
    ["Data is being processed, this may take a few moments and cause some lag..."] = {
        ["ptBR"] = "Os dados estão sendo processados, isso pode levar alguns instantes e causar alguma latência...",
        ["ruRU"] = "Данные обрабатываются, это может занять некоторое время и стать причиной зависаний...",
        ["deDE"] = "Die Daten werden verarbeitet, dies kann einige Momente dauern und etwas Lag verursachen...",
        ["koKR"] = "데이터가 처리중입니다. 이 작업은 몇 분 정도 걸릴 수 있으며, 약간의 지연이 발생할 수 있습니다.",
        ["esMX"] = "Los datos se están procesando, esto puede demorar unos minutos y causar latencia...",
        ["enUS"] = true,
        ["zhCN"] = "数据正在处理中，这可能需要一些时间，并会导致一些延迟...",
        ["zhTW"] = "正在處理資料，這會需要一點時間，並且會造成一些延遲...",
        ["esES"] = "Los datos se están procesando, esto puede demorar unos minutos y causar latencia...",
        ["frFR"] = "Application de la mise à jour, cela peut prendre quelques instants et causer quelques lags...",
    },
    ["Updating NPCs"] = {
        ["ptBR"] = "Atualizando NPCs",
        ["ruRU"] = "Обновление NPC",
        ["deDE"] = "Aktualisiere NPCs",
        ["koKR"] = "NPC 업데이트중",
        ["esMX"] = "Actualizando PNJs",
        ["enUS"] = true,
        ["zhCN"] = "正在更新 NPC 数据",
        ["zhTW"] = "正在更新 NPC 資料",
        ["esES"] = "Actualizando PNJs",
        ["frFR"] = "Mise à jour PNJs",
    },
    ["Updating objects"] = {
        ["ptBR"] = "Atualizando objetos",
        ["ruRU"] = "Обновление объектов",
        ["deDE"] = "Aktualisiere Objekte",
        ["koKR"] = "정보 업데이트중",
        ["esMX"] = "Actualizando objetos",
        ["enUS"] = true,
        ["zhCN"] = "正在更新 目标 数据",
        ["zhTW"] = "正在更新物件資料",
        ["esES"] = "Actualizando objetos",
        ["frFR"] = "Mise à jour objets",
    },
    ["Updating quests"] = {
        ["ptBR"] = "Atualizando missões",
        ["ruRU"] = "Обновление заданий",
        ["deDE"] = "Aktualisiere Quests",
        ["koKR"] = "퀘스트 업데이트중",
        ["esMX"] = "Actualizando misiones",
        ["enUS"] = true,
        ["zhCN"] = "正在更新 任务 数据",
        ["zhTW"] = "正在更新任務資料",
        ["esES"] = "Actualizando misiones",
        ["frFR"] = "Mise à jour quêtes",
    },
    ["Loading database"] = {
        ["ptBR"] = "Carregando o banco de dados",
        ["ruRU"] = "Загрузка базы данных",
        ["deDE"] = "Datenbank wird geladen",
        ["koKR"] = "데이터베이스 로딩중",
        ["esMX"] = "Cargando la base de datos",
        ["enUS"] = true,
        ["zhCN"] = "加载数据库中",
        ["zhTW"] = "正在載入資料庫",
        ["esES"] = "Cargando la base de datos",
        ["frFR"] = "Chargement base de données",
    },
    ["Applying database corrections"] = {
        ["ptBR"] = "Aplicando correções ao banco de dados",
        ["ruRU"] = "Применение исправлений БД",
        ["deDE"] = "Datenbankkorrekturen werden eingespielt",
        ["koKR"] = "데이터베이스 수정 적용중",
        ["esMX"] = "Aplicando correcciones a la base de datos",
        ["enUS"] = true,
        ["zhCN"] = "更新数据库中",
        ["zhTW"] = "正在校正資料庫",
        ["esES"] = "Aplicando correcciones a la base de datos",
        ["frFR"] = "Application des correctifs de base de données",
    },
    ["Initializing locale"] = {
        ["ptBR"] = "Inicializando idioma",
        ["ruRU"] = "Определение языка игры",
        ["deDE"] = "Übersetzungen werden geladen",
        ["koKR"] = "Locale 데이터 설치중",
        ["esMX"] = "Inicializando idioma",
        ["enUS"] = true,
        ["zhCN"] = "初始化语系",
        ["zhTW"] = "正在初始化語系",
        ["esES"] = "Inicializando idioma",
        ["frFR"] = "Initialisation de la langue",
    },
    ["Initializing townfolks"] = {
        ["ptBR"] = "Inicializando cidadãos",
        ["ruRU"] = "Инициализация полезных объектов и NPC (ремонт, почтовый ящик и т.п.)",
        ["deDE"] = "Initialisiere Stadtbewohner",
        ["koKR"] = "도시 NPC 초기화 중",
        ["esMX"] = "Inicializando ciudadanos",
        ["enUS"] = true,
        ["zhCN"] = "初始化镇民",
        ["zhTW"] = "正在初始化村民",
        ["esES"] = "Inicializando ciudadanos",
        ["frFR"] = "Initialisation des citadins",
    },
    ["Optimizing waypoints"] = {
        ["ptBR"] = "Otimizando pontos de rota",
        ["ruRU"] = "Оптимизация путевых точек",
        ["deDE"] = "Optimiere Wegpunkte",
        ["koKR"] = "웨이 포인트 조정 중",
        ["esMX"] = "Optimizando puntos de ruta",
        ["enUS"] = true,
        ["zhCN"] = "初始化地点",
        ["zhTW"] = "正在初始化地點",
        ["esES"] = "Optimizando puntos de ruta",
        ["frFR"] = "Optimisation des points de cheminement",
    },
    ["Updating items"] = {
        ["ptBR"] = "Atualizando itens",
        ["ruRU"] = "Обновление предметов",
        ["deDE"] = "Aktualisiere Gegenstände",
        ["koKR"] = "아이템정보 업데이트중",
        ["esMX"] = "Actualizando objetos",
        ["enUS"] = true,
        ["zhCN"] = "正在读出 物品信息",
        ["zhTW"] = "正在更新物品資訊",
        ["esES"] = "Actualizando objetos",
        ["frFR"] = "Mise à jour objets",
    },
    ["Questie DB update complete!"] = {
        ["ptBR"] = "Atualização do banco de dados do Questie concluída!",
        ["ruRU"] = "Обновление базы данных Questie завершено!",
        ["deDE"] = "Questie Datenbank-Update abgeschlossen!",
        ["koKR"] = "Questie DB 업데이트 완료!",
        ["esMX"] = "¡Actualización de la base de datos de Questie completada!",
        ["enUS"] = true,
        ["zhTW"] = "Questie 資料庫更新完畢!",
        ["zhCN"] = "Questie 数据库更新完成!",
        ["esES"] = "¡Actualización de la base de datos de Questie completada!",
        ["frFR"] = "La base de données Questie a été mise à jour !",
    },
    ["%s for %s!"] = {
        ["ptBR"] = "%s para %s!",
        ["ruRU"] = "%s для %s!",
        ["frFR"] = "%s pour %s !",
        ["koKR"] = "%s 위한 %s!",
        ["zhCN"] = "%s 任务： %s!",
        ["enUS"] = true,
        ["zhTW"] = "%s 任務 %s!",
        ["deDE"] = "%s für %s!",
        ["esES"] = "%s para %s!",
        ["esMX"] = "%s para %s!",
    },
    ["Picked up %s which starts %s!"] = {
        ["ptBR"] = "Pegou %s que inicia %s!",
        ["ruRU"] = "Получен предмет %s, который начинает задание %s",
        ["frFR"] = "Ramassé %s qui démarre %s !",
        ["koKR"] = "%s 를 획득하여 %s!를 시작 할 수 있습니다.",
        ["zhCN"] = "拾取 %s 自动接受任务： %s!",
        ["enUS"] = true,
        ["zhTW"] = "拾取 %s 自動接受任務 %s!",
        ["deDE"] = "%s aufgehoben, das %s startet!",
        ["esES"] = "Recogió %s que inicia %s!",
        ["esMX"] = "Recogió %s que inicia %s!",
    },
    ["You picked up %s which starts %s!"] = {
        ["ptBR"] = "Você pegou %s que inicia %s!",
        ["ruRU"] = "Вы получили предмет %s, который начинает задание %s",
        ["frFR"] = "Vous avez ramassé %s qui démarre %s !",
        ["koKR"] = "%s 을(를) 시작하는 %s 을(를) 수락했습니다",
        ["zhCN"] = "你拾取了 %s 自动接受任务 %s!",
        ["enUS"] = true,
        ["zhTW"] = "你拾取 %s 自動接受任務 %s!",
        ["deDE"] = "Du hast %s aufgehoben, das %s startet!",
        ["esES"] = "¡Recogiste %s que inicia %s!",
        ["esMX"] = "¡Recogiste %s que inicia %s!",
    },
    ["The '%s' world event is active!"] = {
        ["ptBR"] = "O evento mundial '%s' está ativo!",
        ["ruRU"] = "Игровое событие '%s' активно!",
        ["koKR"] = "월드 이벤트 '%s' 활성화",
        ["frFR"] = "L'évènement mondial '%s' est actif !",
        ["zhCN"] = "世界任务 '%s' 已开始!",
        ["enUS"] = true,
        ["zhTW"] = "世界事件 '%s' 已開始!",
        ["deDE"] = "Das '%s' Feiertag-Event ist aktiv!",
        ["esES"] = "¡El evento mundial '%s' está activo!",
        ["esMX"] = "¡El evento mundial '%s' está activo!",
    },
    ["Error during initialization!"] = {
        ["ptBR"] = "Erro durante inicialização!",
        ["koKR"] = "설치중에 에러 발생!",
        ["ruRU"] = "Ошибка во время инициализации!",
        ["frFR"] = "Erreur durant l'initialisation !",
        ["zhCN"] = "初始化时发生错误!",
        ["enUS"] = true,
        ["zhTW"] = "初始化時發生錯誤!",
        ["deDE"] = "Fehler während der Initialisierung!",
        ["esES"] = "¡Error durante la inicialización!",
        ["esMX"] = "¡Error durante la inicialización!",
    },
    ["The quest %s is missing from Questie's database. Please report this on GitHub or Discord!"] = {
        ["ptBR"] = "A missão %s está faltando no banco de dados da Questie. Por favor, informe isso no GitHub ou Discord!",
        ["ruRU"] = "Задание %s отсутствует в БД Questie. Пожалуйста, сообщите нам об этом на GitHub или в Discord!",
        ["koKR"] = "해당 퀘스트 %s 는 퀘스티 데이터베이스에서 찾을 수 없습니다. Github/Discord에 리포트 부탁드립니다!",
        ["frFR"] = "La quête %s n'est pas présente dans la Base de données Questie. Veuillez le signaler sur GitHub ou Discord !",
        ["zhCN"] = "Questie 数据库中缺少的任务 %s，请到 GitHub 或 Discord 上报告，谢谢!",
        ["enUS"] = true,
        ["zhTW"] = "Questie 的資料庫中沒有這個任務 %s，請到 GitHub 或 Discord 做回報!",
        ["deDE"] = "Der Quest %s fehlt in Questie's Datenbank. Bitte melde dies auf GitHub oder Discord!",
        ["esES"] = "Falta la misión %s en la base de datos de Questie. ¡Por favor, infórmalo en GitHub o Discord!",
        ["esMX"] = "Falta la misión %s en la base de datos de Questie. ¡Por favor, infórmalo en GitHub o Discord!",
    },
    ["Coordinates addon is enabled and will cause buggy behavior. Disabling global map and mini map coordinates. These can be re-enabled in settings"] = {
        ["ptBR"] = "O addon de coordenadas está ativado e causará comportamento defeituoso. Desativando coordenadas do mapa global e do minimapa. Estas podem ser reativadas nas configurações.",
        ["ruRU"] = "Включен другой аддон с координатами, это может вызвать ошибки. Во избежание этого Questie сейчас отключает координаты на карте мира и миникарте. Это может быть переопределено в настройках",
        ["deDE"] = "Koordinaten-AddOn aktiviert und verursacht fehlerhaftes Verhalten. Deaktiviere globale Karten- und Minikarten-Koordinaten. Diese können in den Einstellungen wieder aktiviert werden.",
        ["koKR"] = "좌표 애드온이 활성화 되어 버그가 발생할 수 있습니다. 세계 지도 및 미니맵 좌표를 해제하였습니다. 해당 옵션은 퀘스티 옵션에서 다시 켤 수 있습니다.",
        ["esMX"] = "El addon de coordenadas está habilitado y provocará un comportamiento con errores. Está deshabilitando las coordenadas del mapa del mundo y del minimapa. Estos se pueden volver a habilitar en la configuración.",
        ["enUS"] = true,
        ["frFR"] = "L'add-on de coordonnées est activé et causera un comportement erratique. Désactivation des coordonnées de la carte globale et de la minicarte. Elles peuvent être réactivées dans les paramètres.",
        ["esES"] = "El addon de coordenadas está habilitado y provocará un comportamiento con errores. Está deshabilitando las coordenadas del mapa del mundo y del minimapa. Estos se pueden volver a habilitar en la configuración.",
        ["zhTW"] = "已有使用其他座標插件，可能會發生衝突而影響遊戲。請停用世界地圖和小地圖座標，日後都可以在設定中重新啟用。",
        ["zhCN"] = "已使用其他坐标插件，可能因发生冲突而影响游戏。请停用世界地图和小地图坐标，日后都可以在设定中重新启用。",
    },
    ["Missing objective data for quest "] = {
        ["ptBR"] = "Dados de objetivo ausentes para a missão ",
        ["ruRU"] = "Отсутствует информация о цели задания ",
        ["deDE"] = "Fehlende Ziel-Daten für Quest ",
        ["koKR"] = "퀘스트를 위한 오브젝트 데이터가 없습니다",
        ["esMX"] = "Faltan datos de objetivos para la misión ",
        ["enUS"] = true,
        ["frFR"] = "Données d'objectif manquantes pour la quête ",
        ["esES"] = "Faltan datos de objetivos para la misión ",
        ["zhTW"] = "缺少任務目標資料: ",
        ["zhCN"] = "缺少任务目标资料：",
    },
    ["Prints whether you are eligibile to do a quest"] = {
        ["ptBR"] = "Indica se você é elegível para fazer uma missão",
        ["ruRU"] = "Выводит информацию о том, можете ли вы выполнить задание",
        ["deDE"] = "Gibt aus, ob eine Quests angenommen werden kann",
        ["koKR"] = "해당 퀘스트를 수행하기 적절한지 표시합니다",
        ["esMX"] = "Imprime si eres elegible para hacer una misión.",
        ["enUS"] = true,
        ["zhCN"] = false,
        ["zhTW"] = "顯示你是否符合做任務的條件",
        ["esES"] = false,
        ["frFR"] = "Indique si vous êtes éligible pour faire une quête",
    },
    ["Prints Questie and client version info"] = {
        ["ptBR"] = "Mostra informações sobre a versão do Questie e do cliente",
        ["ruRU"] = "Выводит информацию о версиях Questie и клиента",
        ["deDE"] = "Gibt die Questie- und Client-Version aus",
        ["koKR"] = "퀘스티와 클라이언트 버전 정보를 표시합니다",
        ["esMX"] = "Imprime la información de la versión del cliente y Questie",
        ["enUS"] = true,
        ["zhCN"] = false,
        ["zhTW"] = "顯示 Questie 和遊戲版本資訊",
        ["esES"] = "Imprime la información de la versión del cliente y Questie",
        ["frFR"] = "Affiche des informations sur la version de Questie et du client",
    },
    -- Debug Offers
    ["Questie Debug Info"] = {
        ["ptBR"] = "Informações de depuração do Questie",
        ["ruRU"] = "Отладочная информация",
        ["deDE"] = "Questie Debug-Info",
        ["koKR"] = "퀘스티 디버그 정보",
        ["esMX"] = "Información de depuración de Questie",
        ["enUS"] = true,
        ["frFR"] = "Informations de débogage de Questie",
        ["esES"] = "Información de depuración de Questie",
        ["zhTW"] = "Questie 除錯資訊",
        ["zhCN"] = false,
    },
    ["Please share this info with us on"] = {
        ["ptBR"] = "Por favor, compartilhe essas informações conosco",
        ["ruRU"] = "Пожалуйста, поделитесь с нами этой информацией",
        ["deDE"] = "Bitte teile diese Informationen mit uns auf",
        ["koKR"] = "해당 정보를 우리와 공유해 주세요: ",
        ["esMX"] = "Por favor comparte esta información con nosotros en",
        ["enUS"] = true,
        ["frFR"] = "S'il vous plaît, partagez ces informations avec nous",
        ["esES"] = "Por favor comparte esta información con nosotros en",
        ["zhTW"] = "請將此資訊分享給我們，在",
        ["zhCN"] = false,
    },
    ["You can copy the data above"] = {
        ["ptBR"] = "Você pode copiar os dados acima",
        ["ruRU"] = "Вы можете скопировать эти данные выше",
        ["deDE"] = "Du kannst die Daten oben kopieren",
        ["koKR"] = "상기의 데이터를 복사할 수 있습니다",
        ["esMX"] = "Puedes copiar los datos de arriba",
        ["enUS"] = true,
        ["frFR"] = "Vous pouvez copier les données ci-dessus",
        ["esES"] = "Puedes copiar los datos de arriba",
        ["zhTW"] = "你可以複製上方的資料",
        ["zhCN"] = false,
    },
    ["Would you like to help us fix it?"] = {
        ["ptBR"] = "Gostaria de nos ajudar a consertar isso?",
        ["ruRU"] = "Хотите ли вы помочь нам исправить это?",
        ["deDE"] = "Möchtest du uns dabei helfen, dies zu fixen?",
        ["koKR"] = "해당 문제를 해결하기 위해 우리를 도와줄 수 있습니까?",
        ["esMX"] = "¿Quieres ayudarnos a solucionarlo?",
        ["enUS"] = true,
        ["frFR"] = "Souhaitez-vous nous aider à le réparer ?",
        ["esES"] = "¿Quieres ayudarnos a solucionarlo?",
        ["zhTW"] = "是否願意協助我們修正?",
        ["zhCN"] = false,
    },
    ["More Info"] = {
        ["ptBR"] = "Mais informações",
        ["ruRU"] = "Больше информации",
        ["deDE"] = "Mehr Infos",
        ["koKR"] = "더보기",
        ["esMX"] = "Más información",
        ["enUS"] = true,
        ["frFR"] = "Plus d'informations",
        ["esES"] = "Más información",
        ["zhTW"] = "更多資訊",
        ["zhCN"] = false,
    },
    ["An item you just encountered has data missing from the Questie database."] = {
        ["ptBR"] = "Um item que você acabou de encontrar está com dados faltando no banco de dados do Questie.",
        ["ruRU"] = "Обнаруженный вами предмет отсутствует в БД Questie.",
        ["deDE"] = "Ein Gegenstand, den du gerade gefunden hast, fehlt in der Questie-Datenbank.",
        ["koKR"] = "방금 획득한 아이템은 퀘스티 데이터베이스에 등록되지 않은 아이템입니다",
        ["esMX"] = "Un objeto que acaba de encontrar falta en la base de datos de Questie.",
        ["enUS"] = true,
        ["frFR"] = "Un objet que vous venez de rencontrer présente des données manquantes dans la base de données de Questie.",
        ["esES"] = "Un objeto que acaba de encontrar falta en la base de datos de Questie.",
        ["zhTW"] = "Questie 資料庫中缺少你剛才遇到的物品的資料。",
        ["zhCN"] = false,
    },
    ["A quest you just encountered is missing from the Questie database."] = {
        ["ptBR"] = "Uma missão que você acabou de encontrar está faltando no banco de dados do Questie.",
        ["ruRU"] = "Обнаруженное вами задание отсутствует в БД Questie.",
        ["deDE"] = "Eine Quest, die du gerade gefunden hast, fehlt in der Questie-Datenbank.",
        ["koKR"] = "방금 수락한 퀘스트는 퀘스티 데이터베이스에 등록되지 않은 퀘스트입니다.",
        ["esMX"] = "Una misión que acabas de encontrar no se encuentra en la base de datos de Questie.",
        ["enUS"] = true,
        ["frFR"] = "Une quête que vous venez de rencontrer est manquante dans la base de données de Questie.",
        ["esES"] = "Una misión que acabas de encontrar no se encuentra en la base de datos de Questie.",
        ["zhTW"] = "你剛才遇到的任務是 Questie 資料庫中所缺少的。",
        ["zhCN"] = false,
    },
    ["A quest in your quest log is missing from the Questie database and can't be tracked."] = {
        ["ptBR"] = "Uma missão no seu registro de missões está faltando no banco de dados do Questie e não pode ser rastreada.",
        ["ruRU"] = "Задание в вашем журнале отсутствует в БД Questie и не может быть отслежено.",
        ["deDE"] = "Eine Quest in deinem Questlog fehlt in der Questie-Datenbank und kann nicht verfolgt werden.",
        ["koKR"] = "퀘스트 목록에 퀘스티 데이터베이스에 등록되지 않은 퀘스트가 있어 추적이 불가능합니다",
        ["esMX"] = "Falta una misión en tu registro de misiones en la base de datos de Questie y no se puede rastrear.",
        ["enUS"] = true,
        ["frFR"] = "Une quête dans votre journal de quêtes est manquante dans la base de données de Questie et ne peut pas être suivie.",
        ["esES"] = "Falta una misión en tu registro de misiones en la base de datos de Questie y no se puede rastrear.",
        ["zhTW"] = "任務日誌中的任務是 Questie 資料庫中所缺少的，無法追蹤任務。",
        ["zhCN"] = false,
    },
    ["The NPC you just targeted is missing from the Questie database."] = {
        ["ptBR"] = "O NPC que você acabou de mirar está faltando no banco de dados do Questie.",
        ["ruRU"] = "NPC, которого вы только что взяли в цель, отсутствует в БД Questie",
        ["deDE"] = "Der NPC, den du gerade anvisiert hast, fehlt in der Questie-Datenbank.",
        ["koKR"] = "방금 선택한 NPC는 퀘스티 데이터베이스에 존재하지 않습니다",
        ["esMX"] = "El PNJ al que acabas de apuntar no se encuentra en la base de datos de Questie.",
        ["enUS"] = true,
        ["frFR"] = "Le PNJ que vous venez de cibler est manquant dans la base de données de Questie.",
        ["esES"] = "El PNJ al que acabas de apuntar no se encuentra en la base de datos de Questie.",
        ["zhTW"] = "你剛才選為目標的 NPC 是 Questie 資料庫中所缺少的。",
        ["zhCN"] = false,
    },
    -- End Debug Offers
}

for k, v in pairs(debugMessagesLocales) do
    l10n.translations[k] = v
end
