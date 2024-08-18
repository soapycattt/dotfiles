import { css } from "uebersicht";

// styles
const quote = css({
  fontSize: "24px",
});
const author = css({
  fontSize: "18px",
  fontStyle: "italic",
});
export const className = {
  position: "fixed",
  top: "auto",
  bottom: "35%",
  left: "20%",
  right: "auto",
  width: "60%",
  textAlign: "center",
  lineHeight: 1.5,
  fontFamily: "YuKyokasyo, Helvetica Neue",
  fontWeight: "medium",
  fontSmoothing: "antialiased",
  color: "#ffffff",
  textShadow: "2px 2px 2px rgba(64, 64, 64, 0.8)",
};

// refresh frequency
export const refreshFrequency = 86400000; // 1 day

// command
// invoked every `refreshFrequency` milliseconds.
// the return value is passed to the `updateState` function.
export const command = "curl -s https://zenquotes.io/api/today";

// initialState
// SKIP

// updateState
// SKIP

// render
export const render = ({ output }) => {
  if (typeof output === "undefined") {
    return (<div></div>);
  }
  var quotes = JSON.parse(output || "null");
  if (quotes == null) {
    return (<div></div>);
  }
  return (
    <div>
      <span className={quote}>"{quotes[0].q}"</span>
      <br />
      <span className={author}>{quotes[0].a}</span>
    </div>
  );
};
