package ohtu;

public class Submission {
    private String student_number;
    private Sring week;
    private String hours;
    private String a1;
    private String a2;
    private String a3;
    private String a4;
    private String a5;
    private String a6;
    private String a7;
    private String a8;
    private String a9;
    private String a10;
    private String a11;
    private String a12;
    private int count;

    public String getStudent_number() {
        return student_number;
    }

    public String getWeek() {
        return week;
    }

    public String getHours() {
        return hours;
    }

    public String geta1() {
	return a1;
    }

    public String geta2() {
	return a2;
    }

    public String geta3() {
        return a3;
    }

    public String geta4() {
        return a4;
    }

    public String geta5() {
        return a5;
    }

    public String geta6() {
        return a6;
    }

    public String geta7() {
        return a7;
    }

    public String geta8() {
        return a8;
    }

    public String geta9() {
        return a9;
    }

    public String geta10() {
        return a10;
    }

    public String geta11() {
        return a11;
    }

    public String geta12() {
        return a12;
    }

    public int getCount() {
	return count;
    }

    public void setStudent_number(String student_number) {
        this.student_number = student_number;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public void seta1(String a1) {
        this.a1 = a1;
    }

    public void seta2(String a2) {
        this.a2 = a2;
    }

    public void seta3(String a3) {
        this.a3 = a3;
    }

    public void seta4(String a4) {
        this.a4 = a4;
    }

    public void seta5(String a5) {
        this.a5 = a5;
    }

    public void seta6(String a6) {
        this.a6 = a6;
    }

    public void seta7(String a7) {
        this.a7 = a7;
    }

    public void seta8(String a8) {
        this.a8 = a8;
    }

    public void seta9(String a9) {
        this.a9 = a9;
    }

    public void seta10(String a10) {
        this.a10 = a10;
    }

    public void seta11(String a11) {
        this.a11 = a11;
    }

    public void seta12(String a12) {
        this.a12 = a12;
    }

    private String completedExercises() {
	count = 0;
	String s = "";

	if (a1 != null) {
		s += "1 ";
	} else if (a2 != null) {
		s += "2 ";
	} else if (a3 != null) {
		s += "3 ";
	} else if (a4 != null) {
		s += "4 ";
	} else if (a5 != null) {
		s += "5 ";
	} else if (a6 != null) {
		s += "6 ";
	} else if (a7 != null) {
		s += "7 ";
	} else if (a8 != null) {
		s += "8 ";
	} else if (a9 != null) {
		s += "9 ";
	} else if (a10 != null) {
		s += "10 ";
	} else if (a11 != null) {
		s += "11 ";
	} else if (a12 != null) {
		s += "12 ";
	}

	count = s.length() / 2;

	return s;
    }

    @Override
    public String toString() {
        return "viikko " + week + ": tehtyjä tehtäviä yhteensä: " + count + ", aikaa kului " + hours + " tuntia, tehdyt tehtävät: " + completedExercises();
    }
    
}
