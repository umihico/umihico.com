import * as React from "react";
import Letter from "./Letter";
interface hexData {
  letter: string;
  indexHex: string;
  index: number;
  okay: boolean;
}
interface Props {
  columnWidthPercent: number;
  isLeftColumn: boolean;
  letterRows: string[][];
  hexList: hexData[];
  nonce: number;
}
const SplitColumn: React.FC<Props> = ({
  columnWidthPercent,
  isLeftColumn,
  letterRows,
  hexList,
  nonce,
}) => {
  return (
    <div>
      {letterRows.map((row, rowIndex) => {
        return (
          <div key={rowIndex} style={{ display: "table" }}>
            {row.map((letter, colIndex) => {
              return (
                <div
                  key={colIndex}
                  style={{
                    display: "table-cell",
                  }}
                >
                  <Letter
                    columnWidthPercent={columnWidthPercent}
                    isLeftColumn={isLeftColumn}
                    letter={letter}
                    rowIndex={rowIndex}
                    colIndex={colIndex}
                    nonce={nonce}
                    hexList={hexList}
                  />
                </div>
              );
            })}
          </div>
        );
      })}
    </div>
  );
};
export default SplitColumn;
