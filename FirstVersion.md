Процесс закачки состоит из 2х основных шагов:
  1. Получение списка;
  1. Закачка изображений по списку.

Список допустимых источников зафиксирован и не может быть изменен пользователем. Можете <a href='http://code.google.com/p/nekopaw/issues/list'>попросить</a> автора что-то добавить.

Программа не качает флэш-ролики и текст, в случае их наличия они будут проигнорированы.

<img src='http://img38.imageshack.us/img38/2636/imgwn.png' align='right' />
### Содержание ###

  * <a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Получение_списка'>Получение списка</a>
  * <a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Закачка_изображений_по_списку'>Закачка изображений по списку</a>
  * <a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Вкладка_Metadata'>Вкладка Metadata</a>
  * <a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Выборка'>Выборка</a>
  * <a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Вкладка_Settings'>Вкладка Settings</a>
  * <a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Команды_запуска'>Команды запуска</a>
  * <a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Описание_Settings.ini'>Описание Settings.ini</a>
  * <a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Поддерживаемые_борды'>Поддерживаемые борды</a>

# Получение списка #

Первым шагом в скачивании вожделенных картинок является получение списка этих самых картинок. Для этого служит раздел программы "Get" (см. вкладку с таким названием).

Для того, чтобы указать, откуда качать картинки, надо выбрать источник в выпадающем списке "destination".

Ключевые слова указываются в поле ввода "tags". Рядом с этим поле так же есть кнопка "...", вызывающая окно, в котором все тэги можно ввести построчно (1 строка – 1 тэг). По нажатии кнопки "Ok" все эти тэги будут преобразованы в одну строку (и разделены пробелом).

Обратите ваше внимание на то, что в разных галереях системы ключевых слов разные, и они могут не совпадать. Автор не берется объяснять отличия галерей. Так же, в зависимости от системы ключевых слов, можно настраивать не только поиск по тегам, но и категории искомых картинок, или же исключать их (напр. если вам не хочется качать прон). Так что ознакамливайтесь с гайдами ограбляемых вами галерей.

Под полем "tags" находится поле "saved tags". В отличии от просто "tags", эта строчка не стирается при начале нового поиска, загрузке списка из файла или перезапуске программы. Если стоит галочка, то данное поле автоматически добавляется к ключевым словам при начале поиска. Служит для того, чтобы не надо было снова и снова писать одну и ту же строчку тэгов при каждом новом поиске.

Справа от выпадающего списка "destination" находится миникнопка "authentication" (значок с ключом, дает указать логин и пароль для авторизации на ресурсе).

Чтобы получить список с указанного источника и по указанному тегу, надо нажать "get". Если список уже загружен, то вам предложат выбрать 2 варианта обновления: полное и быстрое. Полное обновление полностью перезагружает список отначала до конца. Быстрое обновление завершает получение списка при первом же совпадении с текущим. Тем не менее не все галереи могут быть обновлены или нуждаются в обновлении (напр. е-/эксхентай), в этом случае никаких уведомлений возникать не будет.

Загрузка списка с галерей альбомного типа (вроде е/эксхентая, бур с пулами и т.п.) немного отличается. В этом случае сначала будет получен список альбомов и показано сообщение о том, что теперь надо выбрать нужные альбомы и нажать "Get" повторно. В результате будет получен список изображений из отмеченных альбомов. Чтобы отменить выбор альбомов надо очистить список (крестик справа сверху от таблицы, рядом с чекбоксом "autoscroll").

Чтобы загрузить список из сохраненного ранее файла, надо нажать кнопку "load" рядом с вкладкой "get" и выбрать соответствующий файл (программа понимает списки только в собственном формате igl).

Для сохранения списка в файл надо нажать "save". Программа умеет сохранять в 3х видах:

  * в своем формате списков (igl). Эти списки можно будет обновлять и догружать;
  * в формате txt, просто список ссылок на картинки (напр. для копирования с помощью специальных программ-качалок). Не факт, что вы сможете скопировать картинки с помощью голых URL, т.к. некоторые галереи имеют защиту от хотлинкинга или неавторизованного доступа, с таких галерей придется качать через грабер;
  * в формате csv, список, содержащий имена файлов и связанные с ними тэги.

Под кнопкой "get" находится выпадающий список "after finish", задающее действия после завершения работы. Здесь можно задать, какая вкладка откроется по завершении загрузки. "Stay here" значит остаться на той же вкладке "списка картинок". "Move to metadata" значит, что будет открыта вкладка метаданных. "Move to Downloading" – перейти на вкладку закачки картинок.

У некоторых галерей есть уникальные параметры получения списка:

  * **pixiv.net**
    * можно указать загрузку по id-номеру автора, при этом ключ-тэг можно не указывать. Так же можно выбрать, с какой страницы качать: works (страница работ автора), favorites (страница избранных изображений автора);
  * **deviantart.com**
    * можно указать список категорий, из которых будет производиться закачка (элементы разделены точкой с запятой). Рядом с полем "categories" также есть кнопка "...", которая вызовет редактор списка. Если в него вставлять ссылки на категории, то он автоматически переведет их в нужный формат.
  * **g.e-hentai.org**, **exhentai.org**
    * можно указать временной промежуток между тегами, т.к. слишком "быстрая" скачка может привести к бану на сайте, для это существует чекбокс "query interval". Интервал и его параметры настраивается на вкладке настроек (settings);
  * Теперь можно загружать картинки из так называемых пулов (pools) с стандартнобур. Поддерживаются не на всех стандартнобурах (только на тех, где работает поиск по названию пула). Для этого надо поставить галочку "In pools". Процесс получения списка идентичен процессу получения списка с e/exhentai.

Стоит заметить, что у большинства больших галерей есть предел по количеству результатов за 1 запрос (например на девиантарте - 2500 изображений, пиксиве - 1000 страниц). В этом случае единственное, что можно порекомендовать - уточнять запрос, либо разбивать на множество категорий (в случае с девиантом). Если предел будет достигнут, то загрузка обрывается на последней странице.

<a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Содержание'>К содержанию</a>

# Закачка изображений по списку #

Для начала надо получить список картинок. Это может быть как совсем свежий, только что полученный, так и загруженный из файла. В противном случае вы просто не сможете попасть на вкладку "Download", на которой производится настройка закачки.

Чтобы выбрать путь, куда сохранять картинки, надо указать его в поле "path". Справа от этого поля подряд идут 4 мини-кнопки: browse (лупа, открывает папку в проводнике), set as default (папка с галочкой, делает текущий путь путем по умолчанию), load default (папка со стрелочкой, указывающей вниз, загружает сохраненный раньше путь по умолчанию) и authentication (значок с ключом, позволяет указать логин и пароль для авторизации на ресурсе).

Так же можно сделать, чтобы путь генерировался самостоятельно. Для этого надо поставить галочку рядом с "auto dir name" и указать формат пути в поле рядом. По умолчанию это "?t\?s" (где ?t – название источника, ?s – использованные ключевые слова). За основу берется путь по умолчанию.

Чтобы начать получение списка, надо нажать кнопку "Grab!".

Можно выбрать, какую операцию производить, если попадаются картинки с одинаковыми именами. Для этого в выпадающем списке "if exists" надо указать необходимый вариант:
  * skip - пропустить скачку файла;
  * delete - удалить существующий файл, сохранить на его месте новый;
  * rename - оставить старый файл, сохранить новый с другим именем (filename(<n+1>).jpg).

Можно сохранять сопровождающие файл метаданные в параметрах файла (возможности изображений JPEG), к ним относятся название изображения, тэги, ссылка на страницу, где размещено изображение. Для этого надо установить галочку "save meta to JPEG".

Если пользователь поставил ОЧЕ БОЛЬШОЕ количество картинок на закачку, и у него нет времени следить за процессом (например, ночью), и по завершении работы необходимо выключить компьютер, то для этого есть галочка "shutdown PC after finish" (см. вкладки логов внизу окна).

Конечно же есть дополнительные параметры в зависимости от источника загрузки:

  * **Все стандартнобуры** (похожие на данбуру,гелбуру,имоуту и т.д.)
    * тэги можно указывать в имени сохраняемого файла вместо хэш-строки (поставить галочку "all tags in" и выбрать "filename"). Но т.к. тэгов бывает ОЧЕНЬ много, а имя файла может содержать не более 256 символов, включая расширение, то тэги помещаются не все, а только начальные (по алфавиту). Если в "all tags in" выбрать "csv file", то по завершении процесса скачки в указанном каталоге будет создан csv файл с именем "{строка тэгов} [{источник}] {год-месяц-день}.csv", в котором будет список имен файлов и соотвествующих им тэгов.
  * **pixiv.net**
    * чтобы скачивать альбомы надо установить галочку "download albums".
    * Можно назначить, чтобы альбомы распределялись по папкам, для этого надо поставить галочку "create dirs for albums".
    * Также теперь можно задавать формат для сохранения изображения, для этого надо поставить галочку "name format" и назначить его в соответствующем поле (по умолчанию "?i?p\_p/", т.е. классический; где ?a – никнейм автора (может меняться); ?l – логин автора (не меняется); ?n – название изображения; ?i – id-номер изображения; ?p[{приставка}/] – номер страницы (для альбомов), чтобы добавлялась приставка типа " page " надо написать ее после ключа и изолировать знаком "/"; ?t – используемая для поиска ключ-строка).
  * **deviantart.com**
    * можно распределять картинки по категориям, к которым они принадлежат, для этого надо поставить галочку "create new dirs for categories".
  * **g.e-hentai.org**, **exhentai.org**
    * можно сохранять по альбомам, для этого надо установить галочку "create dirs for albums".
    * Галочка "original filenames" позволяет сохранять изображения с оригинальными именами. Недавно заметил, что в одном альбоме может быть несколько изображений с одинаковыми именами. Если галочку не ставить, то все изображения буду сохраняться с именами файлов, соответствующими id-номеру изображения.
    * Галочка "incremental filenames" подставляет порядковый номер перед именем файла.
    * Галочка "Full Size" включает скачку полноразмерных изображений по ссылке, которая обычно отображается под превью. В этом режиме на вашем аккаунте начинает тратиться GP, а если их нет, то вскоре ничего качаться не будет.
    * Можно изменить интервал между запросами чтобы избежать минибана за автоматизированное копирование (поле "query interval", настраивается с вкладки settings).
  * **thedoujin.com**
    * можно распихивать изображения по папкам с номером альбома (чекбокс "create new dirs for albums") и подставлять порядковый номер перед именем файла ("incremental filenames").

<a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Содержание'>К содержанию</a>

# Вкладка Metadata #

На этой вкладке можно посмотреть все найденные тэги, связанные с текущим изображением метаданные и его превью.

Слева находится общий список тэгов. В скобочках указано, сколько изображений содержит данный тэг.

Можно фильтровать тэги по количеству совпадений, для этого надо указать число в поле "cnt. filter".

Над этим полем находятся 3 кнопки, "выбрать все", "инвертировать выбранное" и "убрать выбор со всех" соответственно. Зачем нужно что-то выбирать см. в разделе "Выборка".

Чтобы отображать плавающее окошко с превью надо поставить галочку "Show preview".

Справа находится поле с краткой информацией о текущем изображении.

Вся эта информация получается со страницы, откуда берется список пикч. Если на данной странице нет необходимой информации, то и в описании ее не будет. Поэтому от галереи к галерее объем и содержание информации может различаться. У некоторых галерей, например, вообще нет годной возможности выделять тэги.

<a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Содержание'>К содержанию</a>

# Выборка #

Как видно, все пункты списка можно помечать галочкой (слева от каждого пункта). Над списком есть меню операций над списком: "Check" (Пометить), "Uncheck" (Убрать пометку), "Delete checked" (Удалить помеченное), "Previous" (Предыдущий помеченный), "Next" (Следующий помеченный), "Goto" (Перейти к указанному по порядковому номеру), "Autoscroll" (автоследование курсора за текущим качающимся файлом).

Для пометки всех элементов надо выбрать "check"→"all" (пометить все). Чтобы выбрать N элементов подряд, сначала надо поставить курсор на начальный элемент, затем зажать Shift и переставить курсор на конечный элемент. Будут выделены все элементы между этими элементами и они сами. Далее надо нажать "check"→"selected" (пометить выделенное). Будут помечены все выделенные элементы.

Чтобы выбрать те элементы, которые содержат определенную строку в URL, надо выбрать пункт "check"→"by keyword" (пометить по ключевому слову).

Чтобы произвести выборку по тэгам, необходимо выбрать пункт "check"→"by tags" (пометить по тэгам). Появится окно с просьбой выбора метода поиска: "and" (будет помечать только те, где есть все выбранные тэги) и "or" (будет искать попадание хотя бы 1го из выбранных тэгов). Как выбирать тэги см. в разделе "Вкладка Metadata"

Чтобы инвертировать выбор элементов, надо выбрать "check"→"inverse".

Пункт "uncheck" содержит те же элементы, что и "check", только действия вызывают обратный эффект – снимают выбор.

<a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Содержание'>К содержанию</a>

# Вкладка Settings #

Здесь можно назначить дополнительные глобальные настройки.

Настройки http-прокси указываются в разделе proxy.

Чтобы увеличить количество потоков, которые будут качать картинки, нужно указать число в поле "Threads". На получение списка это никак не влияет.

Чтобы отображать значок программы в трее, необходимо поставить галочку "show tray icon". В этом случае, если окно программы скрыто или не активно, будут появляться подсказки, уведомляющие о завершении работы и ошибках.

Чтобы окно программы скрывалось при минимизации, необходимо поставить галочку "hide on minimize". Данный пункт возможен только при включенном трей-значке.

Чтобы нельзя было случайно открыть более 1й копии программы, можно поставить галочку "keep one instance".

Также есть уникальная функция, позволяющая открыть крышку устройства чтения оптических дисков (CD/DVD/BD-ROM) при завершении работы программы.

Галочка "save note on closing" отключает напоминание о необходимости сохранить список при закрытии программы, если вы не пользуетесь этой функцией (надо снять галочку)

Галочка "debug mode" включает режим отладки, при котором в логах отображаются ссылки на каждую загружаемую страницу при получении списка, а так же сохраняются копии страниц в папке "logs" в корне папки с программой (ее надо создать вручную, иначе будет ругаться на невозможность создать файл)

Можно выбрать количество автомотических повторов при возникновении ошибок закачки. Для этого надо указать число в поле "count of retries on error". В этом случае программа будет автоматически пробовать скачать страницу или картинку при возникновении ошибки, отличной от 404 ("Не найнедо").

В разделе "query interval" указываются параметры интервала между запросами (для избежания бана). В данный момент необходимо и поддерживается только на е\эксхентае. Здесь можно указать, собственно, интервал (interval), и когда необходимо его вызывать (перед получением ссылки на изображение (before getting url), перед закачкой изображения (before downloading), и после завершения изображения (after downloading).

<a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Содержание'>К содержанию</a>

# Команды запуска #

> Программа имеет строковые команды, с которыми к ней можно обращаться из командной строки. Нет, в MS-DOS она работать не будет. Список команд:
  * **tag=**{тэг}
  * **resid=**{номер ресурса}<br />Список ресурсов:
    * RP\_GELBOORU = 0;
    * RP\_DONMAI\_DANBOORU = 1;
    * RP\_KONACHAN = 2;
    * RP\_IMOUTO = 3;
    * RP\_PIXIV = 4;
    * RP\_SAFEBOORU = 5;
    * RP\_SANKAKU\_CHAN = 6;
    * RP\_BEHOIMI = 7;
    * RP\_EHENTAI\_G = 8;
    * RP\_EXHENTAI = 9;
    * RP\_PAHEAL\_RULE34 = 10;
    * RP\_SANKAKU\_IDOL = 11;
    * RP\_DEVIANTART = 12;
    * RP\_E621 = 13;
    * RP\_413CHAN\_PONIBOORU = 14;
    * RP\_BOORU\_II = 15;
    * RP\_ZEROCHAN = 16;
    * RP\_PAHEAL\_RULE63 = 17;
    * RP\_PAHEAL\_COSPLAY = 18;
    * RP\_XBOORU = 19;
    * RP\_WILDCRITTERS = 20;
    * RP\_BOORU\_RULE34 = 21;
    * RP\_RMART = 22;
    * RP\_DONMAI\_HIJIRIBE = 23;
    * RP\_DONMAI\_SONOHARA = 24;
    * RP\_NEKOBOORU = 25;
    * RP\_THEDOUJIN = 26;
    * RP\_MINITOKYO = 27;
  * **resname=**{url-имя ресурса}<br />URL пишется без "http://", завершающего знака "/" и строки "www.". Короче, точно так же, как в списке "destination".
  * **uid=**{id-номер автора pixiv}<br />При указании этой команды автоматически ставится режим поиска по автору в пиксиве.
  * **list=**{путь к файлу `*`.igl}<br />Загружает список из файла.
  * **get**<br />Применимо только к загруженному списку. Автоматически включается "быстрое обновление" списка. (В случае с альбомными галлереями (типа е-хентая или пуллов) запускает обычную скачку)
  * **download**<br />Применимо только к загруженному списку. Запускает закачку файлов списка.
  * **save**`[`={путь для сохранения}`]`<br />Не иначе, как сохранить список после завершения. Применимо только к загруженному списку (через list=) и при закрытии программы после завершения (close). Можно использовать ключевые слова: ?t - тэг, по которому производится поиск; ?d - "дефолтный" путь, включая параметр "auto dir name".
  * **login=**{логин для входа на ресурс}
  * **password=**{пароль для входа на ресурс}
  * **path=**{путь для сохранения изображений}
  * **close**<br />Закрыть программу после завершения.

> Если в указываемых вами параметрах присутсвуют пробелы, то нужно их изолировать кавычками "".

> Все остальные настройки наследуются из сохраненных. Например, если не указывать путь сохранения, то будет указан путь по умолчанию. Параметры скачки, типа "качать альбомы и раскидывать по папкам", "автоматическая генерация пути" и т.п. плюшки также берутся из сохраненных настроек. То же касается сохраенных логина и пароля (в этом случае параметры login= и password= прописывать нет необходимости). Настройки можно указать в самой программе (расставив все необходимые галочки) или ручками отредактировать файл settings.ini в папке программы.

<a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Содержание'>К содержанию</a>

# Описание Settings.ini #

;секция "общие параметры", загружаются при запуске программы<br />
`[`parametres`]`<br />
;дефолтный путь<br />
dir=c:\tmp\<br />
;id ресурса<br />
destination=23<br />
;ширина окна<br />
width=548<br />
;высота окна<br />
height=542<br />
;состояние окна (0 wsNormal, 1 wsMinimized, 2 wsMaximized)<br />
windowstate=0<br />
;панелька логов скрыта<br />
loghided=0

;настройки<br />
`[`options`]`<br />
;кол-во потоков<br />
threads=5<br />
;качать альбомы<br />
downloadalbums=1<br />
;создавать папки для альбомов<br />
createnewdirs=1<br />
;открыть сд-родм<br />
opendrive=0<br />
;буква сд-рома<br />
driveletter=F<br />
;показывать превью<br />
showpreview=0<br />
;после завершение (после завершения списка перейти на 0 get, 1 metadata, 2 download<br />
afterend=2<br />
;фильтр тэгов по количеству пиков<br />
cntfilter=1<br />
;пропускать существующие (0 skip, 1 delete, 2 rename)<br />
existingfile=0<br />
;чекбокс saved tags<br />
savedtagschecked=0<br />
;derp<br />
savedtags=<br />
;pixiv по автору -1 отключен, 0 из работ, 1 из фаворитов<br />
byauthor=-1<br />
;иконка в трее<br />
trayicon=1<br />
;скрывать при сварачивании (при trayicon=1)<br />
taskbar=1<br />
;защита от запуска 2х копий<br />
keepinstance=1<br />
;автоматическая генерация пути<br />
autodirname=1<br />
;формат автоматической генерации пути<br />
autodirnameformat=?t\?s<br />
;SAVE META TO JPEG<br />
savejpegmeta=1<br />
;интервал запросов в секундах<br />
queryinterval=3<br />
;чекбокс формат имени<br />
nameformatcheck=0<br />
;формат имени<br />
nameformat=?i?p\_p/<br />
;уведомление о несохраненном списке<br />
savenote=1<br />
;чекбокс all tags in<br />
tagsincheck=1<br />
;all tags in 0 filename, 1 cvs file<br />
tagsin=0<br />
;orginal filenames<br />
origfnames=1<br />
;чекбокс quryinterval на вкладке get<br />
checkqueryinterval1=1<br />
;чекбокс quryinterval на вкладке download<br />
checkqueryinterval2=1<br />
;чекбокс before geting list<br />
checkbeforeget=1<br />
;чекбокс before downloading pic<br />
checkbeforedwnld=0<br />
;чекбокс after downloading pic<br />
checkbafterdwnld=0<br />
;кол-во повторов при ошибке<br />
retries=0<br />
;incremental filenames<br />
incfnames=1<br />
;сохранять пароль авторизации на ресурсе<br />
savepwd=1

;настройки таблицы<br />
`[`grid`]`<br />
;автоматически прокручиваться при начале загрузки следующего пика<br />
autoscroll=0

;раздел прокси<br />
`[`proxy`]`<br />
;прокси включен<br />
enabled=1<br />
;хост<br />
host=gateway<br />
;порт <br />
port=3128<br />
;требуется авторизация<br />
auth=1<br />
;логин<br />
login=lgn<br />
;сохранять пароль<br />
savepwd=1<br />
;пароль<br />
pwd=pwd

;данные авторизации на ресурсах<br />
`[`authdata14`]`<br />
login=<br />
pwd=<br />
`[`authdata7`]`<br />
login=<br />
pwd=<br />
;и т.д. `<`кол-во ресурсов`>` раз


<a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Содержание'>К содержанию</a>

# Поддерживаемые борды #

  * ponibooru.413chan.net
  * behoimi.org `[`+ pools`]`
  * ii.booru.org
  * rule34.booru.org (rule34.xxx)
  * deviantart.com `[`+ by categories`]`
  * danbooru.donmai.us `[`+ pools`]`
  * hijiribe.donmai.us `[`+ pools`]`
  * sonohara.donmai.us `[`+ pools`]`
  * g.e-hentai.org
  * e621.net
  * exhentai.org
  * gelbooru.com
  * oreno.imouto.org `[`+ pools`]`
  * konachan.com `[`+ pools`]`
  * minitokyo.net
  * nekobooru.net `[`+ pools`]`
  * cosplay.paheal.net
  * rule34.paheal.net
  * rule63.paheal.net
  * pixiv.net `[`+ by author id `[`works, bookmarks`]``]`
  * rmart.org
  * safebooru.org
  * chan.sankakucomplex.com
  * idol.sankakucomplex.com
  * tbib.org
  * tentaclerape.net
  * thedoujin.com `[`albums`]`
  * wildcritters.ws `[`+ pools`]`
  * xbooru.com
  * zerochan.net

<a href='http://code.google.com/p/nekopaw/wiki/FirstVersion#Содержание'>К содержанию</a>