// Name: Random Video From YouTube Channel
// Description: Open a random video from a specific YouTube Channel
// Author: Monica Powell
// Twitter: @indigitalcolor
// GitHub: @m0nica

``
import "@johnlindquist/kit"


let channelName = await arg("YouTube Channel Name (e.g, yogawithadriene):")

let videos = await scrapeSelector(
    `https://www.youtube.com/c/${channelName}/videos`,
    "a#video-title",
    el => ({
        name: el.innerText,
        value: el.href,
    })
)


let randomVideo = videos[Math.floor(Math.random() * videos.length)]

exec(`open "${randomVideo.value}"`)
