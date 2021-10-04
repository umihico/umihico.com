import * as React from "react";
interface hexData {
  letter: string;
  indexHex: string;
  index: number;
  okay: boolean;
}
interface Props {
  isLeftColumn: boolean;
  rowIndex: number;
  colIndex: number;
  hexList: hexData[];
  nonce: number;
}
const BackgroundLetter: React.FC<Props> = ({
  isLeftColumn,
  rowIndex,
  colIndex,
  nonce,
  hexList,
}) => {
  const startIndex = rowIndex + colIndex * 10;
  return (
    <div className="shadow-letter">
      {isLeftColumn
        ? hexList[(startIndex + nonce) % hexList.length].indexHex
        : hexList[(startIndex + nonce) % hexList.length].letter}
    </div>
  );
};
export default BackgroundLetter;
