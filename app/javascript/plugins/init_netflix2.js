import Netflix from 'netflix2';

Netflix.prototype.getMyList = function (callback) {
  const body = new URLSearchParams()
  body.append("path", '["mylist",["id","length","listId","name","requestId","trackIds"]]')
  body.append("path", '["mylist",{"from":0,"to":48},["promoVideo","summary","title","titleMaturity","userRating","userRatingRequestId"]]')
  body.append("path", '["mylist",{"from":0,"to":48},"boxarts","_342x192","webp"]')
  body.append("authURL", this.authUrls[constants.yourAccountUrl])

  var options = {
    method: 'POST',
    body: body.toString(),//"path=%5B%22mylist%22%2C%5B%22id%22%2C%22length%22%2C%22listId%22%2C%22name%22%2C%22requestId%22%2C%22trackIds%22%5D%5D&path=%5B%22mylist%22%2C%7B%22from%22%3A0%2C%22to%22%3A48%7D%2C%5B%22promoVideo%22%2C%22summary%22%2C%22title%22%2C%22titleMaturity%22%2C%22userRating%22%2C%22userRatingRequestId%22%5D%5D&path=%5B%22mylist%22%2C%7B%22from%22%3A0%2C%22to%22%3A48%7D%2C%22boxarts%22%2C%22_342x192%22%2C%22jpg%22%5D&authURL=1583183198170.HbSdHzU9cC6%2F0ntOgajGdEzYgzQ%3D",
    json: false
  }

  var endpoint = constants.pathEvaluatorEndpointUrl + '?drmSystem=widevine&isVolatileBillboardsEnabled=true&routeAPIRequestsThroughFTL=false&isTop10Supported=true&falcor_server=0.1.0&withSize=true&materialize=true&original_path=%2Fshakti%2Fv3746b1c6%2FpathEvaluato'
  this.__apiRequest(endpoint, options, function (error, response, json) {
    if (error) {
      return callback(error)
    }
    callback(null, json)
  })
}

module.exports = Netflix

// Grab users nf details

const getCredentials = browseBtn.addEventListener('click', (event) => {
  const nfEmail = document.querySelector('#nf_nf_email').value;
  const nfPass = document.querySelector('#nf_nf_pass').value;
  email: nfEmail,
  password: nfPass
});


// init.js code below

var Netflix = require('netflix2')
var netflix = new Netflix()

var credentials = {
  // email: 'vanessa@example.com',
  email: ,
  // password: 'a_password'
  password: // grab from event listener
}

netflix.login(credentials, function (error) {
  if (error) return console.error('cannot log in', error)
  console.log('logged in')

  netflix.getProfiles(function (error, profiles) {
    console.log(profiles, error)
  })

  // need function to show and select profile


  // netflix.switchProfile('user's GUID, function (error) {
  netflix.switchProfile('LLUVWL2OPRD3TE4JZYNNCJFRSA', function (error) {
    if (error) return console.error('cannot switch', error);
    console.log('switched profile')

    netflix.getMyList(function (error, result) {
      if (error) return console.error(error);
      //console.log(JSON.stringify(result));

      const resultObj = JSON.stringify(result)
      console.log("result: ", result);
      const videoObj = JSON.parse(result).jsonGraph.videos
      console.log("video Obj: ", videoObj);
      const videoIds = Object.keys(videoObj)

      const netflixVideos = []
      videoIds.forEach((elem) => {
        const movie = {}
        const title = videoObj[elem].title.value

        movie.title = title
        movie.netflix_id = elem
        console.log("movie", movie);
        netflixVideos.push(movie)
      });

      console.log("HEEEEYYY", netflixVideos);

      return netflixVideos;
    })
    // netflix.browse('1365', 0, 50, function (error, result) {
    //   console.log(JSON.stringify(result));
    // })
  })
})

