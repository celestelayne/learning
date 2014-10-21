// NOTE: This doesn't work at the moment..

var data = data || {}; // Define data beforehand.

var BPMMachine = (function() {
  var interface = {};
  var data = {};


  var setData = function() {
    data.RESET_TIME = 2; // seconds
    data.count = 0;
    data.msecsFirst = 0;
    data.msecsPrevious = 0;
    data.averageBPM = 0;
  }

  setData(); // The first time.

  function TapForBPM(e) {
    timeSeconds = new Date();
    msecs = timeSeconds.getTime();

    if ((msecs - data.msecsPrevious) > 1000 * data.RESET_TIME) {
      data.count = 0;
    }

    if (data.count == 0) {
      data.averageBPM = "First Beat";
      data.msecsFirst = msecs;
      data.count = 1;
    } else {
      bpmAvg = 60000 * data.count / (msecs - data.msecsFirst);
      data.averageBPM = Math.round(bpmAvg * 100) / 100;
      data.count++;
    }
    data.msecsPrevious = msecs;

    console.log(data.averageBPM);

    return true;
  }


  var startTrackingTaps = function() {
      document.addEventListener('keydown', BPMMachine.TapForBPM, false);
  };

  var stopTrackingTaps = function() {
      document.removeEventListener('keydown', BPMMachine.TapForBPM);
  };

  interface.getData = function() { return data; }
  interface.startTrackingTaps = startTrackingTaps;
  interface.stopTrackingTaps = stopTrackingTaps;

  return interface;
})(data);
