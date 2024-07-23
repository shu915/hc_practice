const args = process.argv.slice(2);

let month = new Date().getMonth() + 1;

if (args.length > 0 && args[0] === "-m") {
    const monthInt = parseInt(args[1], 10);
    if (monthInt >= 1 && monthInt <= 12) {
        month = args[1];
    } else {
        console.log('月は1から12までの範囲で入れてください');
        process.exit(1);
    }
} else if(args.length > 0 && args[0] !== "-m") {
    console.log("有効なオプションを入れてください");
    process.exit(1);
}

const year = new Date().getFullYear();
const firstDay = new Date(year, month - 1, 1).getDate();
const firstDayWeek = new Date(year, month - 1, 1).getDay();
const lastDay = new Date(year, month, 0);
const daysInMonth = lastDay.getDate();

console.log(`      ${month}月 ${year}年`)
console.log("日 月 火 水 木 金 土");

const days = [];
for (let i = 1; i <= daysInMonth; i++) {
    days.push(i.toString().padStart(2, ' '));
}

let calendarLine = "   ".repeat(firstDayWeek);
let weekDay = firstDayWeek;

for (let day of days) {
    calendarLine += day + " ";
    weekDay++;
    if (weekDay === 7 || day === days[days.length - 1]) {
        console.log(calendarLine.trimEnd());
        calendarLine = "";
        weekDay = 0;
    }
}