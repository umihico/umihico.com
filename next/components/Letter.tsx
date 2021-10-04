import * as React from "react";
import BackgroundLetter from "./BackgroundLetter";
interface hexData {
  letter: string;
  indexHex: string;
  index: number;
  okay: boolean;
}
interface Props {
  columnWidthPercent: number;
  isLeftColumn: boolean;
  letter: string;
  rowIndex: number;
  colIndex: number;
  hexList: hexData[];
  nonce: number;
}
const Letter: React.FC<Props> = ({
  columnWidthPercent,
  isLeftColumn,
  letter,
  rowIndex,
  colIndex,
  hexList,
  nonce,
}) => (
  <div>
    <div
      style={{
        width: `${isLeftColumn ? (2 * 100 * 0.95) / 48 : 100 / 48}vw`,
      }}
    >
      <span
        style={{
          fontSize: `${(1.2 * 100) / 48}vw`,
        }}
      >
        {letter ? (
          <div className={isLeftColumn ? "text-red" : "text-green"}>
            {letter}
          </div>
        ) : (
          <BackgroundLetter
            rowIndex={rowIndex}
            colIndex={colIndex}
            isLeftColumn={isLeftColumn}
            nonce={nonce}
            hexList={hexList}
          />
        )}
      </span>
    </div>
  </div>
);
export default Letter;
