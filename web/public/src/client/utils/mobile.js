const OrientationInstance = () => {
  const handleOrientationChange = async () => {
    try {
      await document.body.requestFullscreen();
      window.screen?.orientation?.lock("landscape-primary");
    } catch (error) {
      alert(error);
    }
  };

  const init = () => {
    window.screen.orientation.addEventListener(
      "change",
      handleOrientationChange
    );

    setTimeout(handleOrientationChange, 1000);
  };

  return { init };
};

export const Orientation = OrientationInstance();
