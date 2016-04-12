$(function (){

    var fadeTime = 750, // the amount of time in milliseconds that the elements will fade in AND fade out
        delayTime = 2000, // // the amount of time in milliseconds that there will be a delay between the fade ins and fade outs
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
            ($(fadingElem).delay(totalTime * i).fadeIn(fadeTime).delay(delayTime).fadeOut(fadeTime));
        }
    }
});
