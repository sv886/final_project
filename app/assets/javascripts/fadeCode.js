$(function (){

    var yourFade = 1, // the amount of time in seconds that the elements will fade in AND fade out
        yourDelay = 2, // the amount of time in seconds that there will be a delay between the fade ins and fade outs
        fadeTime = yourFade * 1000, //convert fade seconds to milliseconds (1000)
        delayTime = yourDelay * 1000, // convert delay seconds to milliseconds (2000)
        totalTime = fadeTime + delayTime, //3000 milliseconds...needed for all those delays we talked about
        allElems, // find out exactly how many page elements have the 'toBeFaded' class (4)
        elemNoFade, // Will help us find the last element represent the last element (3)
        i,
        fadingElem;

    for (i = 0, allElems = $('.toBeFaded').length, elemNoFade = allElems - 1; i < allElems; i+=1) {
        fadingElem = "#elem" + i;
        if (i === 0) {
            $(fadingElem).fadeIn(fadeTime).delay(delayTime).fadeOut(fadeTime);
        } else if (i === elemNoFade) {
            $(fadingElem).delay(totalTime * i).fadeIn(fadeTime);
        } else {
            $(fadingElem).delay(totalTime * i).fadeIn(fadeTime).delay(delayTime).fadeOut(fadeTime);
        }
    }
});
