import { css } from "uebersicht";

// styles
const date = css({
  fontSize: "64px",
  position: "relative",
  left: "20px",
});
const time = css({
  fontSize: "256px",
});
export const className = {
  // position
  top: "auto",
  bottom: "55%",
  left: "20%",
  width: "60%",
  transform: "translateY(50%)",
  textAlign: "center",
  lineHeight: 1,
  // font
  fontFamily: "YuKyokasho, Helvetica Neue",
  fontWeight: "Medium",
  fontSmoothing: "antialiased",
  // font color
  color: "#ffffff",
  textShadow: "5px 5px 5px rgba(64, 64, 64, 0.8)",
};

// refresh frequency
export const refreshFrequency = 1000; // 1 second

// command
// invoked every `refreshFrequency` milliseconds.
// the return value is passed to the `updateState` function.
export const command = "LC_ALL=C; date +\"%Y/%m/%d(%a) %H:%M\"";

// initialState
// SKIP

// updateState
// SKIP

// render
// the input value ("output") is the return value of `command`.
export const render = ({ output }) => {
  var datetime = output.split(" ");
  return (
    <div>
      <div className={date}>{datetime[0]}</div>
      <br />
      <div className={time}>{datetime[1]}</div>
    </div>
  );
};
