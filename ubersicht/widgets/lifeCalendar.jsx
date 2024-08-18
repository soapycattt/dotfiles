import { css } from "uebersicht";

// Styles
const container = css({
  fontFamily: "Helvetica Neue, Arial, sans-serif",
  color: "#000080",
  padding: "20px",
  background: "rgba(255, 255, 255, 0.8)",
  width: "500px",
  position: "fixed",
  bottom: "20px",
  left: "20px",
  borderRadius: "10px",
  boxShadow: "0 0 20px rgba(0,0,0,0.1)",
});

const title = css({
  textAlign: "center",
  fontSize: "24px",
  marginBottom: "10px",
});

const gridContainer = css({
  position: "relative",
  display: "flex",
  paddingRight: "20px",
});

const monthLabels = css({
  display: "flex",
  justifyContent: "space-between",
  marginLeft: "40px",
  marginBottom: "4px",
  fontSize: "12px",
});

const yearLabels = css({
  display: "flex",
  flexDirection: "column",
  justifyContent: "space-between",
  fontSize: "12px",
  marginRight: "8px",
  textAlign: "right",
});

const grid = css({
  marginLeft: "5px",
});

const row = css({
  display: "flex",
  marginBottom: "2px",
});

const month = css({
  width: "8px",
  height: "12px",
  border: "2px solid #000080",
  marginRight: "1.5px",
});

const redMonth = css({
  width: "8px",
  height: "12px",
  backgroundColor: "red",
  border: "2px solid #000080",
  marginRight: "1.5px",
});

// Command
export const command = 'echo "A 90-Year Human Life in Months"';

// Refresh frequency
export const refreshFrequency = false;

// Function to calculate month difference
const calculateMonthDifference = (birthDate) => {
  const birthYear = birthDate.getFullYear();
  const birthMonth = birthDate.getMonth();

  const currentDate = new Date();
  const currentYear = currentDate.getFullYear();
  const currentMonth = currentDate.getMonth();

  const yearDifference = currentYear - birthYear;
  const monthDifference = currentMonth - birthMonth;

  return yearDifference * 12 + monthDifference;
};

// Render function
const MonthGrid = ({ monthsPerRow, rows, filledMonths }) => {
  const grid = [];
  for (let r = 0; r < rows; r++) {
    const rowMonths = [];
    for (let m = 0; m < monthsPerRow; m++) {
      const monthIndex = r * monthsPerRow + m;
      rowMonths.push(
        <div
          key={`month-${r}-${m}`}
          className={`${monthIndex < filledMonths ? redMonth : month}`}
        ></div>
      );
    }
    grid.push(<div key={`row-${r}`} className={`${row}`}>{rowMonths}</div>);
  }
  return grid;
};

export const render = ({ output }) => {
  const birthDate = new Date('1999-08-28'); // Birthdate: August 28, 1999 (Month is 0-indexed)

  const filledMonths = calculateMonthDifference(birthDate);

  return (
    <div className={`${container}`}>
      <h1 className={`${title}`}>{output}</h1>
      <div className={`${monthLabels}`}>
        {[0, 1, 2, 3].map(num => (
          <span key={`year-${num}`}>{num}</span>
        ))}
      </div>
      <div className={`${gridContainer}`}>
        <div className={`${yearLabels}`}>
          {Array.from({ length: 30 }, (_, i) => i * 3).map(num => (
            <span key={`year-${num}`}>{num}</span>
          ))}
        </div>
        <div className={`${grid}`}>
          <MonthGrid monthsPerRow={36} rows={30} filledMonths={filledMonths} />
        </div>
      </div>
    </div>
  );
};

export default render;
