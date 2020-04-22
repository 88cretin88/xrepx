import React, { Component } from "react";

import CalendarHeatmap from "react-calendar-heatmap";
import "react-calendar-heatmap/dist/styles.css";

class HeatMap extends Component {
    render() {
        return (
            <div>
                <CalendarHeatmap
                    startDate={new Date("2016-01-01")}
                    endDate={new Date("2016-12-31")}
                    values={[
                        { date: "2016-01-01" },
                        { date: "2016-01-22" },
                        { date: "2016-01-30" }
                        // ...and so on
                    ]}
                />
            </div>
        );
    }
}
export default HeatMap;
