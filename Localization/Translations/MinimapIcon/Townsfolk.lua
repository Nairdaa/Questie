---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

local townsfolkLocales = {
    ["Ammo"] = {
        ["ptBR"] = "Munição",
        ["ruRU"] = "Боеприпасы",
        ["deDE"] = "Munition",
        ["koKR"] = "무기상인",
        ["esMX"] = "Municiones",
        ["enUS"] = true,
        ["zhCN"] = "枪械和弹药商",
        ["zhTW"] = "武器商人",
        ["esES"] = "Municiones",
        ["frFR"] = "Munitions",
    },
    ["Auctioneer"] = {
        ["ptBR"] = "Leiloeiro",
        ["ruRU"] = "Аукционер",
        ["deDE"] = "Auktionator:in",
        ["koKR"] = "경매인",
        ["esMX"] = "Subastador",
        ["enUS"] = true,
        ["zhCN"] = "拍卖师",
        ["zhTW"] = "拍賣師",
        ["esES"] = "Subastador",
        ["frFR"] = "Commissaire-priseur",
    },
    ["Bags"] = {
        ["ptBR"] = "Bolsas",
        ["ruRU"] = "Сумки",
        ["deDE"] = "Taschen",
        ["koKR"] = "가방 상인",
        ["esMX"] = "Bolsas",
        ["enUS"] = true,
        ["zhCN"] = "背包",
        ["zhTW"] = "背包商人",
        ["esES"] = "Bolsas",
        ["frFR"] = "Sacs",
    },
    ["Banker"] = {
        ["ptBR"] = "Banqueiro",
        ["ruRU"] = "Банкир",
        ["deDE"] = "Bankier",
        ["koKR"] = "은행원",
        ["esMX"] = "Banquero",
        ["enUS"] = true,
        ["zhCN"] = "银行职员",
        ["zhTW"] = "銀行職員",
        ["esES"] = "Banquero",
        ["frFR"] = "Banquier",
    },
    ["Battlemaster"] = {
        ["ptBR"] = "Mestre de batalha",
        ["ruRU"] = "Военачальник",
        ["deDE"] = "Kampfmeister:in",
        ["koKR"] = "전투모병관",
        ["esMX"] = "Maestro de batalla",
        ["enUS"] = true,
        ["zhCN"] = "战场军官",
        ["zhTW"] = "戰場軍官",
        ["esES"] = "Maestro de batalla",
        ["frFR"] = "Maître de guerre",
    },
    ["Class Trainer"] = {
        ["ptBR"] = "Instrutor de classe",
        ["ruRU"] = "Учитель классовых навыков",
        ["deDE"] = "Lehrer:in für eine Klasse",
        ["koKR"] = "직업 상급자",
        ["esMX"] = "Instructor de clase",
        ["enUS"] = true,
        ["zhCN"] = "职业训练师",
        ["zhTW"] = "職業訓練師",
        ["esES"] = "Instructor de clase",
        ["frFR"] = "Maître de classe",
    },
    ["Drink"] = {
        ["ptBR"] = "Bebidas",
        ["ruRU"] = "Напитки",
        ["deDE"] = "Getränke",
        ["koKR"] = "음료 상인",
        ["esMX"] = "Bebidas",
        ["enUS"] = true,
        ["zhCN"] = "水商",
        ["zhTW"] = "飲料商人",
        ["esES"] = "Bebidas",
        ["frFR"] = "Boissons",
    },
    ["Flight Master"] = {
        ["ptBR"] = "Mestre de voo",
        ["ruRU"] = "Распорядитель полетов",
        ["deDE"] = "Flugmeister:in",
        ["koKR"] = "비행 조련사",
        ["esMX"] = "Maestro de vuelo",
        ["enUS"] = true,
        ["zhCN"] = "飞行管理员",
        ["zhTW"] = "飛行管理員",
        ["esES"] = "Maestro de vuelo",
        ["frFR"] = "Maître de vol",
    },
    ["Food"] = {
        ["ptBR"] = "Comida",
        ["ruRU"] = "Еда",
        ["deDE"] = "Essen",
        ["koKR"] = "음식 상인",
        ["esMX"] = "Comida",
        ["enUS"] = true,
        ["zhCN"] = "面包商人",
        ["zhTW"] = "麵包商人",
        ["esES"] = "Comida",
        ["frFR"] = "Nourriture",
    },
    ["Innkeeper"] = {
        ["ptBR"] = "Estalajadeiro",
        ["ruRU"] = "Хозяин таверны",
        ["deDE"] = "Gastwirt:in",
        ["koKR"] = "여관주인",
        ["esMX"] = "Tabernero",
        ["enUS"] = true,
        ["zhCN"] = "旅馆老板",
        ["zhTW"] = "旅店老闆",
        ["esES"] = "Tabernero",
        ["frFR"] = "Aubergiste",
    },
    ["Mailbox"] = {
        ["ptBR"] = "Caixa de correio",
        ["ruRU"] = "Почтовый ящик",
        ["deDE"] = "Briefkasten",
        ["koKR"] = "우체통",
        ["esMX"] = "Buzón",
        ["enUS"] = true,
        ["zhCN"] = "邮箱",
        ["zhTW"] = "郵箱",
        ["esES"] = "Buzón",
        ["frFR"] = "Boîte aux lettres",
    },
    ["Profession Trainer"] = {
        ["ptBR"] = "Instrutores de profissões",
        ["ruRU"] = "Учитель профессий",
        ["deDE"] = "Berufsausbilder",
        ["koKR"] = "기술 전문가",
        ["esMX"] = "Instructor de profesión",
        ["enUS"] = true,
        ["zhCN"] = "专业训练师",
        ["zhTW"] = "專業技能訓練師",
        ["esES"] = "Instructor de profesión",
        ["frFR"] = "Maître de profession",
    },
    ["Reagents"] = {
        ["ptBR"] = "Reagentes",
        ["ruRU"] = "Реагенты",
        ["deDE"] = "Reagenzien",
        ["koKR"] = "마법 재료 상인",
        ["esMX"] = "Componentes",
        ["enUS"] = true,
        ["zhCN"] = "施法材料",
        ["zhTW"] = "施法材料",
        ["esES"] = "Componentes",
        ["frFR"] = "Composants",
    },
    ["Repair"] = {
        ["ptBR"] = "Conserto",
        ["ruRU"] = "Ремонт",
        ["deDE"] = "Reparieren",
        ["koKR"] = "장비 수리",
        ["esMX"] = "Reparación",
        ["enUS"] = true,
        ["zhCN"] = "修理",
        ["zhTW"] = "修理",
        ["esES"] = "Reparación",
        ["frFR"] = "Réparations",
    },
    ["Spirit Healer"] = {
        ["ptBR"] = "Anjo da Cura",
        ["ruRU"] = "Целитель душ",
        ["deDE"] = "Geistheiler",
        ["koKR"] = "영혼의 치유사",
        ["esMX"] = "Ángel de la Resurrección",
        ["enUS"] = true,
        ["zhCN"] = "灵魂医者",
        ["zhTW"] = "靈魂醫者",
        ["esES"] = "Ángel de la Resurrección",
        ["frFR"] = "Gardien des âmes",
    },
    ["Stable Master"] = {
        ["ptBR"] = "Mestre de estábulo",
        ["ruRU"] = "Смотритель стойл",
        ["deDE"] = "Stallmeister:in",
        ["koKR"] = "야수 관리인",
        ["esMX"] = "Maestro de establos",
        ["enUS"] = true,
        ["zhCN"] = "兽栏管理员",
        ["zhTW"] = "獸欄管理員",
        ["esES"] = "Maestro de establos",
        ["frFR"] = "Maître des écuries",
    },
    ["Meeting Stone"] = {
        ["ptBR"] = "Pedra de Encontro",
        ["ruRU"] = "Камень встреч",
        ["deDE"] = "Versammlungsstein",
        ["koKR"] = "만남의 돌",
        ["esMX"] = "Roca de encuentro",
        ["enUS"] = true,
        ["zhCN"] = "集合石",
        ["zhTW"] = "集合石",
        ["esES"] = "Roca de encuentro",
        ["frFR"] = "Pierre de rencontre",
    },
    ["Meeting Stones"] = {
        ["ptBR"] = "Pedra de Encontro",
        ["ruRU"] = "Камни встреч",
        ["deDE"] = "Versammlungssteine",
        ["koKR"] = "만남의 돌",
        ["esMX"] = "Rocas de encuentro",
        ["enUS"] = true,
        ["zhCN"] = "集合石",
        ["zhTW"] = "集合石",
        ["esES"] = "Rocas de encuentro",
        ["frFR"] = "Pierre de rencontre",
    },
    ["Pet Food"] = {
        ["ptBR"] = "Comida de ajudante",
        ["ruRU"] = "Еда для питомцев",
        ["deDE"] = "Futter",
        ["koKR"] = "펫 먹이",
        ["esMX"] = "Comida de mascota",
        ["enUS"] = true,
        ["zhCN"] = "宠物食物",
        ["zhTW"] = "寵物食物",
        ["esES"] = "Comida de mascota",
        ["frFR"] = "Nourriture de familier",
    },
    ["Portal Trainer"] = {
        ["ptBR"] = "Treinamento de Portais",
        ["ruRU"] = "Мастер порталов",
        ["deDE"] = "Portallehrer",
        ["koKR"] = "순간이동 전문 마법사",
        ["esMX"] = "Instructor de portal",
        ["enUS"] = true,
        ["zhCN"] = "传送门训练师",
        ["zhTW"] = "傳送門訓練師",
        ["esES"] = "Instructor de portal",
        ["frFR"] = "Maître des portails",
    },
    ["Potions"] = {
        ["ptBR"] = "Poções",
        ["ruRU"] = "Зелья",
        ["deDE"] = "Tränke",
        ["koKR"] = "물약",
        ["esMX"] = "Pociones",
        ["enUS"] = true,
        ["zhCN"] = "药剂",
        ["zhTW"] = "藥水商人",
        ["esES"] = "Pociones",
        ["frFR"] = true,
    },
    ["Trade Goods"] = {
        ["ptBR"] = "Mercadorias",
        ["ruRU"] = "Хозяйственные товары",
        ["deDE"] = "Handwerkswaren",
        ["koKR"] = "각종용품 상인",
        ["esMX"] = "Objetos comerciables",
        ["enUS"] = true,
        ["zhCN"] = "商人",
        ["zhTW"] = "雜貨商人",
        ["esES"] = "Objetos comerciables",
        ["frFR"] = "Fournitures d'artisanat",
    },
    ["Vendor"] = {
        ["ptBR"] = "Comerciante",
        ["ruRU"] = "Торговец",
        ["deDE"] = "Verkäufer:in",
        ["koKR"] = "상인",
        ["esMX"] = "Vendedor",
        ["enUS"] = true,
        ["zhCN"] = "商人",
        ["zhTW"] = "商人",
        ["esES"] = "Vendedor",
        ["frFR"] = "Marchand",
    },
    ["Weapon Master"] = {
        ["ptBR"] = "Mestre de Armas",
        ["ruRU"] = "Эксперт по оружию",
        ["deDE"] = "Waffenmeister:in",
        ["koKR"] = "무기 전문가",
        ["esMX"] = "Maestro de armas",
        ["enUS"] = true,
        ["zhCN"] = "武器大师",
        ["zhTW"] = "武器大師",
        ["esES"] = "Maestro armero",
        ["frFR"] = "Maître d'armes",
    },
    ["Townsfolk"] = {
        ["ptBR"] = "Cidadãos",
        ["ruRU"] = "Городские",
        ["deDE"] = "Stadtbewohner:in",
        ["koKR"] = "마을 NPC",
        ["esMX"] = "Ciudadanos",
        ["enUS"] = true,
        ["zhCN"] = false,
        ["zhTW"] = "村民",
        ["esES"] = "Ciudadanos",
        ["frFR"] = "Citadins",
    },
}

for k, v in pairs(townsfolkLocales) do
    l10n.translations[k] = v
end
