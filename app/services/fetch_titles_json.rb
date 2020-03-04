# this is the code using the json object so we don't have to call the API.

class FetchTitlesJson


  def getCountries
    jsonData = '{"poster":"","tomatoUserRating":"0","rated":"N/A","tomatoUserReviews":"0","filmid":"80212301","runtime":"N/A","top250tv":"0","imdbid":"tt7776244","metascore":"N/A","tomatoRating":"0","tomatoMeter":"0","released":"19 Dec 2017","top250":"0","imdbvotes":"5","imdbrating":"7.6","awards":"N/A","genre":"Reality-TV","tomatoConsensus":"N/A","plot":"N/A","type":"","localimage":"","tomatoFresh":"0","language":"Japanese","newid":"29898","tomatoUserMeter":"0","tomatoRotten":"0","tomatoReviews":"0","country":"Japan","date":"2018-03-14 04:00:09"}'
    result = JSON.parse(jsonData)

    countries = result["ITEMS"].map { |item| { code: item[1], name: item[2] } }
    return countries
  end

  def getExpiringContent(countryCode)

    jsonData = '{"COUNT":"51","ITEMS":[{"netflixid":"70296444","title":"Drones","image":"http://art-0.nflximg.net/7e210/c95b08aff5e62852a3f9be44c9c8f12f65b7e210.jpg","synopsis":"The moral gray area of drone warfare plays out in this thriller about a seasoned drone pilot, his rookie trainee, and a target half a world away.<br><b>Expires on 2017-08-14</b>","rating":"2.7","type":"movie","released":"2013","runtime":"1h19m","largeimage":"http://cdn1.nflximg.net/images/9475/10869475.jpg","unogsdate":"2017-08-14","imdbid":"tt2179027","download":"0"},{"netflixid":"70123196","title":"Food Matters","image":"http://art-2.nflximg.net/e7199/68750870d37a42e32afec154314cb45f16ee7199.jpg","synopsis":"This film takes a timely and hard-hitting look at how the food we eat is helping or hurting our health, and what we can do to live (and eat) better.<br><b>Expires on 2017-08-14</b>","rating":"4.04503","type":"movie","released":"2008","runtime":"1h14m","largeimage":"http://cdn1.nflximg.net/images/6938/8626938.jpg","unogsdate":"2017-08-14","imdbid":"tt1528734","download":"1"},{"netflixid":"70143809","title":"American Dad!","image":"http://art-2.nflximg.net/6f571/c27238f1d9728cf902183bae3f74c0a45a66f571.jpg","synopsis":"This comedy follows a conservative CIA agent and his eccentric brood, which includes a talking goldfish with the brain of an East German athlete.<br><b>Expires on 2017-08-15</b>","rating":"3.7697785","type":"series","released":"2005","runtime":"","largeimage":"","unogsdate":"2017-08-15","imdbid":"tt0397306","download":"0"},{"netflixid":"80005231","title":"Eddie Pepitone: In Ruins","image":"http://art-1.nflximg.net/42b67/a42b73613ccbc8c1b0183171d367541324c42b67.jpg","synopsis":"Eddie Pepitone delivers dark, raging humor in his hometown of Brooklyn, covering the perils of being a male model and the death of the American Dream.<br><b>Expires on 2017-08-15</b>","rating":"3.2464855","type":"movie","released":"2014","runtime":"1h4m","largeimage":"http://cdn1.nflximg.net/images/7703/9957703.jpg","unogsdate":"2017-08-15","imdbid":"tt3974972","download":"1"},{"netflixid":"70259256","title":"Great Expectations","image":"http://art-0.nflximg.net/2cec0/728494a3b7210af3f4cd8b635ccd2a3db872cec0.jpg","synopsis":"Fate -- with a little help from a mysterious unnamed benefactor -- whisks young orphan Pip from poverty to a life of unexpected wealth.<br><b>Expires on 2017-08-15</b>","rating":"3.6225104","type":"movie","released":"2012","runtime":"2h8m","largeimage":"http://cdn1.nflximg.net/images/6277/21046277.jpg","unogsdate":"2017-08-15","imdbid":"tt1836808","download":"0"},{"netflixid":"70307849","title":"Alex of Venice","image":"http://art-2.nflximg.net/d5658/1c8677f38a74192419079b708fe38f0bb82d5658.jpg","synopsis":"Devastated after her husband leaves, a controlling attorney must juggle work and family responsibilities while reevaluating her life choices.<br><b>Expires on 2017-08-15</b>","rating":"2.5616255","type":"movie","released":"2014","runtime":"1h26m","largeimage":"http://cdn0.nflximg.net/images/2934/20892934.jpg","unogsdate":"2017-08-15","imdbid":"tt2977090","download":"1"},{"netflixid":"70297433","title":"El sexo d&eacute;bil","image":"http://art-2.nflximg.net/20c6c/8ae5d37b41798e89d529cc3c243892af5bc20c6c.jpg","synopsis":"Suddenly and inexplicably abandoned by all the women in their lives, a father and his sons try to understand what has happened and why.<br><b>Expires on 2017-08-15</b>","rating":"3.8228374","type":"series","released":"2011","runtime":"","largeimage":"http://cdn0.nflximg.net/images/1957/21011957.jpg","unogsdate":"2017-08-15","imdbid":"tt1809550","download":"1"},{"netflixid":"70147810","title":"Race to Nowhere","image":"http://art-1.nflximg.net/c4d5e/668f1c1bdada201b5ac34abbd1a75bf4c7dc4d5e.jpg","synopsis":"Vicki Abeles&#39;s cautionary documentary focuses on the potential adverse impact of parents&#39; mounting obsession with their kids&#39; academic results.<br><b>Expires on 2017-08-15</b>","rating":"3.7108655","type":"movie","released":"2009","runtime":"1h25m","largeimage":"http://cdn1.nflximg.net/images/0323/13030323.jpg","unogsdate":"2017-08-15","imdbid":"tt1437364","download":"1"},{"netflixid":"80066750","title":"Spooksville","image":"http://art-2.nflximg.net/1dd88/099b883e3e2f368462a0af02713fbb6208e1dd88.jpg","synopsis":"In Spooksville, new kid Adam joins forces with two other teens to battle dark forces that have been plaguing the town for centuries.<br><b>Expires on 2017-08-15</b>","rating":"3","type":"series","released":"2013","runtime":"","largeimage":"http://cdn1.nflximg.net/images/1477/21811477.jpg","unogsdate":"2017-08-15","imdbid":"tt2788518","download":"1"},{"netflixid":"80062113","title":"1992","image":"http://art-0.nflximg.net/8728e/f01d50d8d77e938e4c9ecc9c36400df3a238728e.jpg","synopsis":"Based on historical events, this crime drama centers on Italian operation &#39;Clean Hands,&#39; set in motion to tame the tide of political corruption.<br><b>Expires on 2017-08-15</b>","rating":"3","type":"series","released":"2015","runtime":"","largeimage":"http://cdn1.nflximg.net/images/2659/22352659.jpg","unogsdate":"2017-08-15","imdbid":"tt2983290","download":"1"},{"netflixid":"1051852","title":"To Kill a Mockingbird","image":"http://art-1.nflximg.net/459d4/a050fb1b37226557b66b28f3bc7f0895490459d4.jpg","synopsis":"Atticus Finch defends an innocent black man against rape charges but ends up in a maelstrom of hate and prejudice.<br><b>Expires on 2017-08-15</b>","rating":"4.148354","type":"movie","released":"1962","runtime":"2h9m","largeimage":"http://cdn0.nflximg.net/images/5247/22595247.jpg","unogsdate":"2017-08-15","imdbid":"tt0056592","download":"1"},{"netflixid":"18170222","title":"Enemy of the State","image":"http://art-2.nflximg.net/d3a38/3c4e51448f0171ead51fb661de897e39b35d3a38.jpg","synopsis":"After a hacker slips an incriminating video into his pocket, a hotshot lawyer finds himself fleeing from a rogue National Security agent.<br><b>Expires on 2017-08-15</b>","rating":"3.8690536","type":"movie","released":"1998","runtime":"2h12m","largeimage":"http://cdn1.nflximg.net/images/0443/8690443.jpg","unogsdate":"2017-08-15","imdbid":"tt0120660","download":"0"},{"netflixid":"70245034","title":"Bill Burr: You People Are All the Same","image":"http://art-1.nflximg.net/e5efb/c9159da50368bfe6bb6ca2c2700ea9a9609e5efb.jpg","synopsis":"Funnyman Bill Burr takes the stage to uncork a profanity-laced, incisive routine that pokes fun at plastic surgery, reality TV, gold diggers and more.<br><b>Expires on 2017-08-16</b>","rating":"4.160036","type":"movie","released":"2012","runtime":"1h8m","largeimage":"http://cdn1.nflximg.net/images/3627/11773627.jpg","unogsdate":"2017-08-16","imdbid":"tt2290153","download":"0"},{"netflixid":"70063588","title":"Dead Silence","image":"http://art-1.nflximg.net/cc74e/2ef6df1affdde6412d30999058c74302f36cc74e.jpg","synopsis":"In the wake of his bride&#39;s death, grieving newlywed Jamie is forced to return to his hometown, where he butts heads with the ghost of a ventriloquist.<br><b>Expires on 2017-08-16</b>","rating":"3.360301","type":"movie","released":"2007","runtime":"1h29m","largeimage":"http://cdn0.nflximg.net/images/8161/8298161.jpg","unogsdate":"2017-08-16","imdbid":"tt0455760","download":"1"},{"netflixid":"70293668","title":"Felony","image":"http://art-2.nflximg.net/c6849/b5fba2211ea553b0e1b77cff7638ee8089dc6849.jpg","synopsis":"When police officer Malcolm Toohey hits a young boy while driving drunk, he makes the fateful decision to conceal his crime.<br><b>Expires on 2017-08-16</b>","rating":"3.2218382","type":"movie","released":"2013","runtime":"1h47m","largeimage":"http://cdn0.nflximg.net/images/5911/11995911.jpg","unogsdate":"2017-08-16","imdbid":"tt2402603","download":"1"},{"netflixid":"70305193","title":"Axel: The Biggest Little Hero","image":"http://art-1.nflximg.net/5b9ac/df5fff904fb3f47bba22169bdc2db119d9c5b9ac.jpg","synopsis":"When famine threatens their village, Axel and his pal Jono face menacing foes and natural disaster on a journey to find a new source of food.<br><b>Expires on 2017-08-16</b>","rating":"3.1047537","type":"movie","released":"2013","runtime":"1h20m","largeimage":"http://cdn1.nflximg.net/images/6963/9666963.jpg","unogsdate":"2017-08-16","imdbid":"tt3468298","download":"1"},{"netflixid":"80064392","title":"Hot Wheels: The Skills to Thrill","image":"http://art-2.nflximg.net/b7d94/1827beca1a5ee8837e8bab7e30a490ff314b7d94.jpg","synopsis":"When a shifty guy comes to town peddling new driverless cars, the folks in Hot Wheels City rejoice, but soon learn the cost of giving up the wheel.<br><b>Expires on 2017-08-16</b>","rating":"3.064516","type":"movie","released":"2015","runtime":"45m","largeimage":"http://cdn1.nflximg.net/images/4999/22244999.jpg","unogsdate":"2017-08-16","imdbid":"notfound","download":"1"},{"netflixid":"80064297","title":"Team Hot Wheels: Build the Epic Race","image":"http://art-0.nflximg.net/104b3/b786d9e404c220ee0ede6ab80904805611b104b3.jpg","synopsis":"Team Hot Wheels must defeat the Road Pirates on a new racetrack to stop them from winning a key to the team&#39;s latest technology and using it for evil.<br><b>Expires on 2017-08-16</b>","rating":"3","type":"movie","released":"2015","runtime":"44m","largeimage":"http://cdn1.nflximg.net/images/0073/21910073.jpg","unogsdate":"2017-08-16","imdbid":"tt3823912","download":"1"},{"netflixid":"80036191","title":"Ejecta","image":"http://art-1.nflximg.net/9636e/fe94fb0e072f7582d9725c73bdb92c29c749636e.jpg","synopsis":"After four decades of repeated contact with aliens, a paranoid blogger has plenty to write about. And the universe is starting to take notice.<br><b>Expires on 2017-08-18</b>","rating":"2.6938775","type":"movie","released":"2014","runtime":"1h22m","largeimage":"http://cdn1.nflximg.net/images/1049/22081049.jpg","unogsdate":"2017-08-18","imdbid":"tt2176722","download":"1"},{"netflixid":"80019101","title":"LA SAPIENZA","image":"http://art-2.nflximg.net/4f426/f12e827d57c48a763abb4e53bcf2c82e9fd4f426.jpg","synopsis":"A married couple who&#39;ve gradually grown apart find themselves reenergized by a pair of young siblings they meet while visiting Italy.<br><b>Expires on 2017-08-18</b>","rating":"3.015625","type":"movie","released":"2014","runtime":"1h44m","largeimage":"http://cdn0.nflximg.net/images/1516/21431516.jpg","unogsdate":"2017-08-18","imdbid":"tt3182590","download":"0"},{"netflixid":"70153397","title":"CSI: NY","image":"http://art-2.nflximg.net/755bf/ff8021e6dcea0096f01ef4dad123c40f00d755bf.jpg","synopsis":"Science in the service of crime fighting comes to the Big Apple in the second spinoff of the popular &#39;CSI&#39; franchise.<br><b>Expires on 2017-08-22</b>","rating":"3.8170133","type":"series","released":"2004","runtime":"","largeimage":"http://cdn0.nflximg.net/images/3253/9143253.jpg","unogsdate":"2017-08-22","imdbid":"tt0395843","download":"1"},{"netflixid":"80155880","title":"Explore TV","image":"http://art-2.nflximg.net/a8fd5/52880c6235f35f2a29ac0a6e0ee24fc1c03a8fd5.jpg","synopsis":"Host Trevor Cochrane searches the world for interesting tourist destinations and reveals the cuisine, culture and natural splendor in each location.<br><b>Expires on 2017-08-22</b>","rating":"3","type":"series","released":"2016","runtime":"","largeimage":"","unogsdate":"2017-08-22","imdbid":"tt1505097","download":"0"},{"netflixid":"70197037","title":"Revenge","image":"http://art-1.nflximg.net/b8dcc/6199d12170f404420e1fa0c00f61c3fc90ab8dcc.jpg","synopsis":"A young woman moves to the Hamptons and charms the pants off her new neighbors -- while plotting their downfall for sins committed against her family.<br><b>Expires on 2017-08-28</b>","rating":"4.277025","type":"series","released":"2011","runtime":"","largeimage":"http://cdn0.nflximg.net/images/3228/22623228.jpg","unogsdate":"2017-08-28","imdbid":"tt1837642","download":"0"},{"netflixid":"80158110","title":"Lockup: Women Behind Bars","image":"http://art-0.nflximg.net/174c2/aa915da3bea884b90a578be981dc9fec41b174c2.jpg","synopsis":"This collection focuses on women&#39;s prisons in America and the unique challenges female inmates face while serving time for crimes big and small.<br><b>Expires on 2017-08-28</b>","rating":"3.064516","type":"series","released":"2013","runtime":"","largeimage":"","unogsdate":"2017-08-28","imdbid":"tt0996992","download":"1"},{"netflixid":"70157187","title":"The League","image":"http://art-0.nflximg.net/f71fb/e7cd2ba1fdf4dd1d5a76e7a4b171c2b578ef71fb.jpg","synopsis":"Fantasy football tackles reality in this semi-scripted look at some friends whose hobby provides an outlet in the form of trash-talking and deceit.<br><b>Expires on 2017-08-30</b>","rating":"4.1589766","type":"series","released":"2009","runtime":"","largeimage":"http://cdn0.nflximg.net/images/7086/11167086.jpg","unogsdate":"2017-08-30","imdbid":"tt1480684","download":"0"},{"netflixid":"70140361","title":"Better Off Ted","image":"http://art-1.nflximg.net/51735/a51b6f6551255e4bf80cac42401c1c5204d51735.jpg","synopsis":"Ted, a single dad working at a soulless conglomerate, tries to balance his own code of ethics with the odd and immoral assignments he must carry out.<br><b>Expires on 2017-09-01</b>","rating":"4.028665","type":"series","released":"2009","runtime":"","largeimage":"http://cdn1.nflximg.net/images/4431/9034431.jpg","unogsdate":"2017-09-01","imdbid":"tt1235547","download":"0"},{"netflixid":"70143821","title":"Foyle&#39;s War","image":"http://art-2.nflximg.net/4ef3c/02888345c9b1f3d1b927302ea981a2e684b4ef3c.jpg","synopsis":"Set during World War II, this crime drama follows police inspector Christopher Foyle, who learns that crooks don&#39;t stop for anything -- not even war.<br><b>Expires on 2017-09-01</b>","rating":"3.8677557","type":"series","released":"2002","runtime":"","largeimage":"http://cdn0.nflximg.net/images/4838/10974838.jpg","unogsdate":"2017-09-01","imdbid":"tt0310455","download":"1"},{"netflixid":"80071197","title":"Badults","image":"http://art-0.nflximg.net/a2ce2/91bb02033e53c8e6954fe2ab4c2a38b2e48a2ce2.jpg","synopsis":"The members of the comedy group Pappy&#39;s star in this sitcom about childhood pals who fail miserably at adulthood through a series of misadventures.<br><b>Expires on 2017-09-01</b>","rating":"2.967742","type":"series","released":"2013","runtime":"","largeimage":"http://cdn1.nflximg.net/images/2877/22352877.jpg","unogsdate":"2017-09-01","imdbid":"tt3084090","download":"1"},{"netflixid":"80036142","title":"Los hombres tambien lloran","image":"http://art-0.nflximg.net/80a7f/4c5f4bf819082607e7f697d0f3bd4aeddda80a7f.jpg","synopsis":"This romantic comedic series follows Javier, a doctor who has everything -- great career, beautiful wife, nice home -- until he suddenly doesn&#39;t.<br><b>Expires on 2017-09-01</b>","rating":"3.7867966","type":"series","released":"2014","runtime":"","largeimage":"http://cdn1.nflximg.net/images/7937/23557937.jpg","unogsdate":"2017-09-01","imdbid":"tt4066622","download":"1"},{"netflixid":"70286809","title":"Zig and Sharko","image":"http://art-1.nflximg.net/3eb7d/db477da7918bf104e328760fb983cf86d363eb7d.jpg","synopsis":"Zig, an island-bound hyena, will do anything to get his paws on Marina the mermaid, but her devoted pal Sharko always comes to her rescue in time.<br><b>Expires on 2017-09-01</b>","rating":"3.5672839","type":"series","released":"2010","runtime":"","largeimage":"http://cdn0.nflximg.net/images/4588/8904588.jpg","unogsdate":"2017-09-01","imdbid":"tt2046005","download":"1"},{"netflixid":"70286808","title":"Oggy and the Cockroaches","image":"http://art-0.nflximg.net/d79a6/2eaf42089abbe9d7d06cae8572b3de2cc8ed79a6.jpg","synopsis":"Wimpy blue cat Oggy would like nothing more than to snooze, but he&#39;s constantly bothered by the three ugly cockroaches who have invaded his home.<br><b>Expires on 2017-09-01</b>","rating":"3.4538453","type":"series","released":"1998","runtime":"","largeimage":"http://cdn0.nflximg.net/images/2805/8902805.jpg","unogsdate":"2017-09-01","imdbid":"tt0213363","download":"1"},{"netflixid":"70171936","title":"The Deep End","image":"http://art-1.nflximg.net/63da5/812a110c092298d199088bbe8b11e82cdc163da5.jpg","synopsis":"Five first-year associates work at one of Los Angeles&#39;s most prestigious and ruthless law firms under two very different managing partners.<br><b>Expires on 2017-09-01</b>","rating":"3.7","type":"series","released":"2010","runtime":"","largeimage":"http://cdn0.nflximg.net/images/3124/9243124.jpg","unogsdate":"2017-09-01","imdbid":"tt1441219","download":"0"},{"netflixid":"80040980","title":"Housos","image":"http://art-2.nflximg.net/b3e5e/a8c4ba9ee7557072d0976ddd8a7f45c74d9b3e5e.jpg","synopsis":"This wild satire follows the misadventures of a group of friends living in an Australian housing project as they attempt scams and dodge the law.<br><b>Expires on 2017-09-01</b>","rating":"3.6905499","type":"series","released":"2011","runtime":"","largeimage":"http://cdn0.nflximg.net/images/3254/12923254.jpg","unogsdate":"2017-09-01","imdbid":"tt2103538","download":"1"},{"netflixid":"80041222","title":"Better Man","image":"http://art-1.nflximg.net/3e641/2cab593bbfb6b5f259791ba21b2789101993e641.jpg","synopsis":"Desperate to provide for his impoverished family, a Vietnamese-Australian man agrees to smuggle heroin from Cambodia via Singapore.<br><b>Expires on 2017-09-01</b>","rating":"3.8395414","type":"series","released":"2013","runtime":"","largeimage":"http://cdn0.nflximg.net/images/2918/12922918.jpg","unogsdate":"2017-09-01","imdbid":"tt2381048","download":"1"},{"netflixid":"70272724","title":"Wilfred (AU)","image":"http://art-1.nflximg.net/43358/24ac0047d86ed39199ac111e50dcc155d8443358.jpg","synopsis":"A deeply depressed man has surreal experiences after becoming convinced that his neighbor&#39;s dog, Wilfred, is actually a man wearing a costume.<br><b>Expires on 2017-09-01</b>","rating":"3.571243","type":"series","released":"2007","runtime":"","largeimage":"http://cdn1.nflximg.net/images/4099/12924099.jpg","unogsdate":"2017-09-01","imdbid":"tt0899203","download":"1"},{"netflixid":"70177019","title":"The Batman","image":"http://art-2.nflximg.net/5975d/ca4ca91e84cc76e83662fc887193a152e075975d.jpg","synopsis":"This Emmy-winning cartoon centers on Batman&#39;s early years as sworn protector of Gotham City, with actor Adam West (who portrayed the Caped Crusader in the classic 1960s television series &#39;Batman&#39;) swooping in as the voice of the...<br><b>Expires on 2017-09-01</b>","rating":"3.6559434","type":"series","released":"2007","runtime":"","largeimage":"","unogsdate":"2017-09-01","imdbid":"tt3769348","download":"0"},{"netflixid":"70245165","title":"Great Raids of World War II","image":"http://art-0.nflximg.net/d1264/d72520b93d2b6de74a0ec962bfd7f461135d1264.jpg","synopsis":"This series presents six stories of small-scale Allied military operations told through the accounts of World War II veterans and archival footage.<br><b>Expires on 2017-09-01</b>","rating":"3.9021618","type":"series","released":"2003","runtime":"","largeimage":"http://cdn0.nflximg.net/images/7250/9727250.jpg","unogsdate":"2017-09-01","imdbid":"tt2798686","download":"0"},{"netflixid":"70213112","title":"Auschwitz: Inside the Nazi State","image":"http://art-2.nflximg.net/2c33f/e2396bc57f7ed06013057e89dd589e44a962c33f.jpg","synopsis":"This documentary series tackles one of history&#39;s most disquieting subjects: the Holocaust and the infamous Auschwitz-Birkenau concentration camp.<br><b>Expires on 2017-09-01</b>","rating":"3.918074","type":"series","released":"2005","runtime":"","largeimage":"http://cdn1.nflximg.net/images/5911/23145911.jpg","unogsdate":"2017-09-01","imdbid":"tt0446610","download":"0"},{"netflixid":"80029501","title":"Generation Earth","image":"http://art-1.nflximg.net/de175/6a3117c9c3998bf3be4d15f4e59c5037f79de175.jpg","synopsis":"Join Dallas Campbell on a journey around the globe to discover how mankind has used technology, determination and ingenuity to transform our planet.<br><b>Expires on 2017-09-01</b>","rating":"4.2158566","type":"series","released":"2012","runtime":"","largeimage":"http://cdn1.nflximg.net/images/3063/11913063.jpg","unogsdate":"2017-09-01","imdbid":"tt4650890","download":"0"},{"netflixid":"70245166","title":"The Last Nazis","image":"http://art-1.nflximg.net/5b416/7f715991899b0de24cfe1ff5b0b239c9a155b416.jpg","synopsis":"A landmark documentary series comprised of three compelling stories regarding the hunt for the last remaining Nazi war criminals.<br><b>Expires on 2017-09-01</b>","rating":"3.4341416","type":"series","released":"2009","runtime":"","largeimage":"http://cdn1.nflximg.net/images/2347/8542347.jpg","unogsdate":"2017-09-01","imdbid":"tt3358434","download":"0"},{"netflixid":"80036587","title":"The World&#39;s War: Forgotten Soldiers of the Empire","image":"http://art-1.nflximg.net/a75bf/7cd14ef72c28728a60c650fd67cb28421b4a75bf.jpg","synopsis":"Historian David Olusoga shares the story of the millions of Indian, African and Asian troops who fought in the First World War.<br><b>Expires on 2017-09-01</b>","rating":"2.5","type":"series","released":"2014","runtime":"","largeimage":"http://cdn0.nflximg.net/images/8650/20938650.jpg","unogsdate":"2017-09-01","imdbid":"tt3967920","download":"0"},{"netflixid":"80045666","title":"Our World War","image":"http://art-2.nflximg.net/602aa/26a2c3906467816805376d809f8cac5945f602aa.jpg","synopsis":"During World War I, British troops face the horrors of the Battle of Mons in 1914, internal strife in 1916 and innovative tank warfare in 1918.<br><b>Expires on 2017-09-01</b>","rating":"4.255195","type":"series","released":"2014","runtime":"","largeimage":"http://cdn1.nflximg.net/images/4115/20974115.jpg","unogsdate":"2017-09-01","imdbid":"tt3419604","download":"0"},{"netflixid":"80036423","title":"Egypt","image":"http://art-2.nflximg.net/f0115/bd597be0ca13e2374a6e44a4efe9eb2100cf0115.jpg","synopsis":"Using historical flashbacks and re-creations, this dramatic series tells the stories behind some of the great archaeological discoveries in Egypt.<br><b>Expires on 2017-09-01</b>","rating":"4.0919976","type":"series","released":"2005","runtime":"","largeimage":"http://cdn1.nflximg.net/images/9647/13049647.jpg","unogsdate":"2017-09-01","imdbid":"tt0483603","download":"0"},{"netflixid":"80036600","title":"Ocean Giants","image":"http://art-2.nflximg.net/af9dd/aa5acf5ee1156541d47c542e202fe7e46a9af9dd.jpg","synopsis":"This series explores the lives of whales, including the cognitive and social attributes that make them unique among the Earth&#39;s species.<br><b>Expires on 2017-09-01</b>","rating":"4.218671","type":"series","released":"2011","runtime":"","largeimage":"http://cdn0.nflximg.net/images/7532/13037532.jpg","unogsdate":"2017-09-01","imdbid":"tt2350779","download":"0"},{"netflixid":"80045664","title":"Filthy Cities","image":"http://art-0.nflximg.net/1a600/5ad6294dfa86dcfc17f9a76630f7c60c85c1a600.jpg","synopsis":"Historian Dan Snow examines the dirt and disease that engulfed London, Paris and New York in centuries past, and how each city cleaned up its act.<br><b>Expires on 2017-09-01</b>","rating":"3","type":"series","released":"2011","runtime":"","largeimage":"http://cdn0.nflximg.net/images/7628/20937628.jpg","unogsdate":"2017-09-01","imdbid":"tt1962642","download":"0"},{"netflixid":"80036185","title":"Supervolcano","image":"http://art-1.nflximg.net/69f56/5c499c422180de27576c2d2e486858538f269f56.jpg","synopsis":"This explosive docudrama imagines what would happen if the supervolcano on which Yellowstone National Park sits erupted.<br><b>Expires on 2017-09-01</b>","rating":"3.7384825","type":"series","released":"2005","runtime":"","largeimage":"http://cdn0.nflximg.net/images/6692/12066692.jpg","unogsdate":"2017-09-01","imdbid":"tt0419372","download":"0"},{"netflixid":"80023641","title":"How to Grow a Planet","image":"http://art-0.nflximg.net/75875/981c25696b19775af3148d86e2f834818c075875.jpg","synopsis":"This documentary series reveals how plants, and not humans, are the most crucial living thing on Earth, with the power to both sustain and destroy us.<br><b>Expires on 2017-09-01</b>","rating":"4.2032576","type":"series","released":"2012","runtime":"","largeimage":"http://cdn1.nflximg.net/images/9781/11699781.jpg","unogsdate":"2017-09-01","imdbid":"tt2244001","download":"0"},{"netflixid":"80036430","title":"Nuremberg: Nazis on Trial","image":"http://art-0.nflximg.net/145d4/3d40f513acd8241121346f375237eedd8c7145d4.jpg","synopsis":"Using contemporary interviews, archival footage and dramatic reenactments, this series tells the story of the Nuremberg trials of three Nazis.<br><b>Expires on 2017-09-01</b>","rating":"3.8932571","type":"series","released":"2006","runtime":"","largeimage":"http://cdn1.nflximg.net/images/7927/13037927.jpg","unogsdate":"2017-09-01","imdbid":"tt0814234","download":"0"},{"netflixid":"70155581","title":"Star Wars: The Clone Wars","image":"http://art-2.nflximg.net/44d4b/ed0bc98774b85bae13dc12bd5299e777a2f44d4b.jpg","synopsis":"Follow the animated adventures of the Jedi knights, including Anakin Skywalker and his master, Obi-Wan Kenobi. Season 6 available only on Netflix.<br><b>Expires on 2017-09-07</b>","rating":"4.091709","type":"series","released":"2008","runtime":"","largeimage":"http://cdn1.nflximg.net/images/7675/11347675.jpg","unogsdate":"2017-09-07","imdbid":"tt0458290","download":"0"},{"netflixid":"70155603","title":"Army Wives","image":"http://art-0.nflximg.net/8d442/bd2231a1fa882339a9543387fa24a0b94a68d442.jpg","synopsis":"Four women and one man, each married to a soldier and living on an army base, contend with infidelity, PTSD and their spouses&#39; long deployments.<br><b>Expires on 2017-09-10</b>","rating":"4.1166897","type":"series","released":"2007","runtime":"","largeimage":"http://cdn1.nflximg.net/images/7527/8337527.jpg","unogsdate":"2017-09-10","imdbid":"tt0859592","download":"0"},{"netflixid":"80036243","title":"Fugitivos","image":"http://art-2.nflximg.net/88ec9/85c14b6e1fb7a105f7bef347c6baed33da188ec9.jpg","synopsis":"Juli&aacute;n and Esperanza, both unjustly imprisoned, form a passionate bond behind bars and conceive a daring scheme to prove their innocence.<br><b>Expires on 2017-09-10</b>","rating":"3.852976","type":"series","released":"2014","runtime":"","largeimage":"http://cdn0.nflximg.net/images/2694/21012694.jpg","unogsdate":"2017-09-10","imdbid":"tt3952932","download":"1"}]}'
    result = JSON.parse(jsonData)

    content = result["ITEMS"].map { |item|
      {
        netflixid: item["netflixid"],
        title: item["title"],
        image_url: item["image"],
        plot: item["synopsis"].split('<br>')[0],
        category: item["type"],
        expiration_date: Date.parse(item["unogsdate"]),
        imdbid: item["imdbid"],
      }
    }
    return content
  end

  def getContentDetails(imdbid)
    jsonData = '{"poster":"","tomatoUserRating":"0","rated":"N/A","tomatoUserReviews":"0","filmid":"80212301","runtime":"N/A","top250tv":"0","imdbid":"tt7776244","metascore":"N/A","tomatoRating":"0","tomatoMeter":"0","released":"19 Dec 2017","top250":"0","imdbvotes":"5","imdbrating":"7.6","awards":"N/A","genre":"Reality-TV","tomatoConsensus":"N/A","plot":"N/A","type":"","localimage":"","tomatoFresh":"0","language":"Japanese","newid":"29898","tomatoUserMeter":"0","tomatoRotten":"0","tomatoReviews":"0","country":"Japan","date":"2018-03-14 04:00:09"}'
    result = JSON.parse(jsonData)

    content = {
      genre: result["genre"],
      plot: result["plot"],
      # add more details
    }
  end

end
