var $bar, perc, start, update;

$bar = $('.percentage');

perc = 0;

update = function() {
  $bar.css("height", perc + '%');
  $bar.attr("perc", Math.floor(perc) + '%');
  if (perc < 100) {
    perc += 0.1;
    if (Math.floor(perc) === 5) {
      $bar.addClass('active');
    }
    if (Math.floor(perc) === 95) {
      return $bar.removeClass('active');
    }
  }
};

const startTimer = () => {
  if ($('.bar').length > 0);
  setInterval(update, 10);
};

export { startTimer };
