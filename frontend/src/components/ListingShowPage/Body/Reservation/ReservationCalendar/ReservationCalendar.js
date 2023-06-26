import "../../ShowBody.css"
import 'react-date-range/dist/styles.css'; // main style file
import 'react-date-range/dist/theme/default.css'; // theme css file
import { DateRange } from 'react-date-range';
import { useState } from "react";


export const ReservationCalendar = ({handleCheckinDate, handleCheckoutDate, endingDate, startingDate}) => {



    const [dateState, setDateState] = useState([
        {
          startDate: new Date(),
          endDate: new Date(),
          key: 'selection',
          color: "black",
        }
    ]);

    const handleSelect = (date) => {
        setDateState([date.selection]);
        handleCheckinDate(date.selection.startDate);
        handleCheckoutDate(date.selection.endDate);
    }

    return (
        <div className="reservation-check-in-check-out-calendar-container">
            <DateRange
                ranges={dateState}
                onChange={handleSelect}
                months={2}
                direction="horizontal"
                preventSnapRefocus={true}
                showSelectionPreview={true}
                moveRangeOnFirstSelection={false}
                minDate={new Date()}
                disabledDates={[new Date("2023-07-29")]}
            />
        </div>
    )
}   