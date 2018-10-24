package bmi.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bmi.exceptions.ImpossibleHeightException;
import bmi.exceptions.ImpossibleWeightException;
import bmi.model.BMICalculator;
import bmi.model.MetricConverter;

@WebServlet("/bmi")
public class BMIServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public BMIServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String unitType = request.getParameter("unit");
		if (unitType.equals("metric")) {
			session.setAttribute("unit", unitType);
		}
		if (unitType.equals("imperial")) {
			session.setAttribute("unit", unitType);
		}
		request.getRequestDispatcher("/metric.jsp").forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		BMICalculator objBMICalculator = new BMICalculator();

		String resFile = "/calculate.jsp";
		String meter = request.getParameter("height").trim();
		String kg = request.getParameter("weight").trim();
		double hight, weight, result;

		try {
			hight = Double.parseDouble(meter);
			weight = Double.parseDouble(kg);
			if (session.getAttribute("unit").equals("metric")) {
				objBMICalculator.setHeight(hight);
				objBMICalculator.setWeight(weight);
			} else {
				objBMICalculator.setHeight(MetricConverter.inchToMeter(hight));
				objBMICalculator.setWeight(MetricConverter.poundToKg(weight));
			}
			result = objBMICalculator.calculateBMI();
			request.setAttribute("urBMI", result);
			request.setAttribute("hight", hight);
			request.setAttribute("weight", weight);
			request.setAttribute("description", BMICalculator.getDescription(result));
		} catch (NumberFormatException e) {
			request.setAttribute("exception", "Height and weight must be numaric values");
			resFile = "/error.jsp";
		} catch (ImpossibleHeightException | ImpossibleWeightException e) {
			request.setAttribute("errMsg", e.getMessage());
			// resFile = "/error.jsp";
			resFile = "/metric.jsp";
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher(resFile);
			rd.forward(request, response);
		}

	}

}
