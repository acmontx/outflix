require 'byebug'

class FetchTitlesJson


  def getCountries
    jsonData = '({"COUNT":"95","ITEMS":[["276","ao","Angola ","25","117","12","2863","891","1972","USD","7.99","9.99","11.99"],["21","ar","Argentina ","69","152","25","4386","966","3420","ARS","109","149","189"],["24","aw","Aruba ","39","179","34","5184","1258","3925","USD","7.99","9.99","11.99"],["23","au","Australia ","63","242","20","3887","1160","2727","AUD","8.99","11.99","14.99"],["22","at","Austria ","48","110","24","2768","668","2100","EUR","7.99","9.99","11.99"],["285","bh","Bahrain ","10","71","6","2301","568","1733","USD","7.99","9.99","11.99"],["282","bd","Bangladesh ","41","192","10","3499","1000","2499","USD","7.99","9.99","11.99"],["294","by","Belarus ","22","116","12","3061","914","2147","EUR","7.99","9.99","11.99"],["26","be","Belgium ","37","199","67","3297","728","2568","EUR","7.99","9.99","11.99"],["32","bz","Belize ","41","170","30","4873","1187","3686","USD","7.99","9.99","11.99"],["28","bo","Bolivia","31","150","25","4388","965","3423","USD","7.99","9.99","11.99"],["29","br","Brazil ","32","143","23","4212","888","3324","BRL","19.9","22.9","29.9"],["284","bg","Bulgaria ","31","119","12","3020","906","2114","EUR","7.99","9.99","11.99"],["33","ca","Canada ","76","266","25","4908","1212","3695","CAD","7.99","9.99","11.99"],["35","cl","Chile ","231","294","25","4386","964","3422","CLP","4190","5190","6190"],["36","co","Colombia ","90","149","25","4386","965","3421","COP","16900","22900","28900"],["37","cr","Costa Rica ","182","280","25","4384","966","3418","USD","7.99","9.99","11.99"],["333","hr","Croatia ","27","116","12","2982","901","2081","EUR","7.99","9.99","11.99"],["306","cy","Cyprus ","23","118","12","2929","885","2044","EUR","7.99","9.99","11.99"],["307","cz","Czech Republic ","27","118","12","3013","907","2106","EUR","7.99","9.99","11.99"],["40","dk","Denmark ","27","124","14","2827","581","2246","DKK","79","89","119"],["42","do","Dominican Republic ","31","151","25","4375","954","3421","USD","7.99","9.99","11.99"],["43","ec","Ecuador ","188","281","25","4383","965","3418","USD","7.99","9.99","11.99"],["311","eg","Egypt ","10","70","6","2294","571","1723","USD","7.99","9.99","11.99"],["75","sv","El Salvador ","184","292","25","4382","965","3417","USD","7.99","9.99","11.99"],["310","ee","Estonia ","21","118","12","3039","909","2130","EUR","7.99","9.99","11.99"],["44","fi","Finland ","23","124","15","2982","571","2411","EUR","7.99","9.99","11.99"],["45","fr","France ","36","132","64","2937","723","2213","EUR","7.99","9.99","11.99"],["320","ge","Georgia ","23","114","12","3053","905","2148","EUR","7.99","9.99","11.99"],["39","de","Germany ","54","108","24","2776","674","2102","EUR","7.99","9.99","11.99"],["322","gi","Gibraltar ","35","182","19","3601","1075","2526","EUR","7.99","9.99","11.99"],["327","gr","Greece ","11","69","9","2569","701","1868","EUR","7.99","9.99","11.99"],["51","gt","Guatemala ","68","154","25","4387","965","3422","USD","7.99","9.99","11.99"],["53","hn","Honduras ","31","154","25","4387","965","3422","USD","7.99","9.99","11.99"],["331","hk","Hong Kong ","17","96","7","2604","580","2024","HKD","63","78","93"],["334","hu","Hungary ","23","113","12","3009","907","2102","EUR","7.99","9.99","11.99"],["265","is","Iceland ","46","144","12","2993","848","2145","EUR","7.99","9.99","11.99"],["337","in","India ","23","202","10","3688","1015","2673","INR","500","650","800"],["335","id","Indonesia ","21","124","13","3164","879","2285","IDR","109000","139000","169000"],["340","ir","Iran","23","116","11","2847","849","1998","USD","7.99","9.99","11.99"],["55","ie","Ireland ","58","215","34","4439","1200","3239","EUR","7.99","9.99","11.99"],["336","il","Israel ","15","73","6","2397","625","1772","USD","7.99","9.99","11.99"],["269","it","Italy ","49","107","14","2720","490","2230","EUR","7.99","9.99","11.99"],["267","jp","Japan ","84","227","69","6129","1262","4867","JPY","650","950","1450"],["350","kz","Kazakhstan ","27","169","13","3189","915","2274","EUR","7.99","9.99","11.99"],["342","ke","Kenya ","27","117","12","2865","889","1976","USD","7.99","9.99","11.99"],["358","lv","Latvia ","22","118","12","3046","915","2131","EUR","7.99","9.99","11.99"],["357","lt","Lithuania ","22","118","12","3043","913","2130","EUR","7.99","9.99","11.99"],["371","mo","Macao ","15","114","7","2609","582","2027","USD","7.99","9.99","11.99"],["378","my","Malaysia ","30","124","13","3150","865","2285","MYR","33","42","51"],["376","mv","Maldives ","44","197","11","3498","968","2530","USD","7.99","9.99","11.99"],["374","mt","Malta ","33","168","29","3609","1009","2600","EUR","7.99","9.99","11.99"],["375","mu","Mauritius ","26","124","13","2917","900","2017","USD","7.99","9.99","11.99"],["65","mx","Mexico ","36","151","25","4381","957","3424","MXN","99","129","159"],["370","mn","Mongolia ","28","130","13","3023","906","2117","USD","7.99","9.99","11.99"],["360","ma","Morocco ","20","71","6","2290","567","1723","USD","7.99","9.99","11.99"],["384","np","Nepal ","44","205","11","3586","972","2614","USD","7.99","9.99","11.99"],["67","nl","Netherlands ","48","105","16","2813","609","2204","EUR","7.99","9.99","11.99"],["69","nz","New Zealand ","52","202","18","3830","1145","2685","NZD","9.99","12.99","15.99"],["66","ni","Nicaragua ","30","154","25","4387","965","3422","USD","7.99","9.99","11.99"],["266","ng","Nigeria ","28","117","12","2863","888","1975","USD","7.99","9.99","11.99"],["68","no","Norway ","30","124","13","2824","580","2244","NOK","79","99","129"],["387","om","Oman ","11","71","6","2296","568","1728","USD","7.99","9.99","11.99"],["391","pk","Pakistan ","39","197","10","3514","1003","2511","USD","7.99","9.99","11.99"],["70","pa","Panama ","39","170","28","4871","1180","3691","USD","7.99","9.99","11.99"],["72","py","Paraguay ","29","151","25","4393","967","3426","USD","7.99","9.99","11.99"],["71","pe","Peru ","81","148","25","4385","965","3420","USD","7.99","9.99","11.99"],["390","ph","Philippines ","27","123","13","3175","880","2295","PHP","370","460","550"],["392","pl","Poland ","13","69","9","2555","593","1962","PLN","34","43","52"],["268","pt","Portugal ","15","89","10","2427","513","1914","EUR","7.99","9.99","11.99"],["395","pr","Puerto Rico ","57","200","34","4260","1116","3143","USD","7.99","9.99","11.99"],["400","ro","Romania ","12","75","9","2626","700","1926","EUR","7.99","9.99","11.99"],["402","ru","Russia","23","124","12","3068","905","2163","EUR","7.99","9.99","11.99"],["404","sa","Saudi Arabia ","10","71","6","2294","568","1726","USD","7.99","9.99","11.99"],["401","rs","Serbia ","29","116","12","2991","907","2084","EUR","7.99","9.99","11.99"],["408","sg","Singapore ","16","88","9","2713","711","2002","SGD","10.98","13.98","16.98"],["412","sk","Slovakia ","26","117","12","3016","910","2106","EUR","7.99","9.99","11.99"],["410","si","Slovenia ","31","116","12","2989","904","2085","EUR","7.99","9.99","11.99"],["447","za","South Africa","31","144","10","3009","995","2014","USD","7.99","9.99","11.99"],["348","kr","South Korea","11","162","6","2848","601","2247","KRW","9500","12000","14500"],["270","es","Spain ","57","126","9","2812","614","2198","EUR","7.99","9.99","11.99"],["354","lk","Sri Lanka ","46","205","11","3628","1000","2628","USD","7.99","9.99","11.99"],["73","se","Sweden ","26","122","13","2804","583","2221","SEK","79","99","119"],["34","ch","Switzerland ","32","180","52","3322","811","2511","CHF","11.9","14.9","17.9"],["434","tw","Taiwan","15","102","7","2668","612","2056","TWD","270","330","390"],["425","th","Thailand ","16","92","10","2852","716","2136","THB","280","350","420"],["77","tt","Trinidad and Tobago ","36","171","30","4867","1177","3690","USD","7.99","9.99","11.99"],["432","tr","Turkey ","19","81","9","2456","624","1832","EUR","7.99","9.99","11.99"],["436","ua","Ukraine ","23","119","12","3057","907","2150","EUR","7.99","9.99","11.99"],["272","ae","United Arab Emirates ","10","72","6","2294","568","1726","USD","7.99","9.99","11.99"],["46","gb","United Kingdom","63","216","34","4472","1222","3250","GBP","5.99","7.49","8.99"],["78","us","United States","58","189","51","5484","1463","4020","USD","7.99","9.99","11.99"],["79","uy","Uruguay ","30","151","25","4393","967","3426","USD","7.99","9.99","11.99"],["81","ve","Venezuela","34","151","25","4391","965","3426","USD","7.99","9.99","11.99"],["442","vn","Vietnam","22","102","10","2840","721","2119","VND","180000","220000","260000"]]})'
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
        expiration_date: Date.parse(item["unogsdate"])
      }
    }
    return content
  end
end
