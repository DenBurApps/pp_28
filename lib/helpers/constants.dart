import 'package:pp_28/helpers/image/image_helper.dart';

const categoryIcons = [
  SvgNames.cat_1,
  SvgNames.cat_2,
  SvgNames.cat_3,
  SvgNames.cat_4,
  SvgNames.cat_5,
  SvgNames.cat_6,
  SvgNames.cat_7,
  SvgNames.cat_8,
  SvgNames.cat_9,
  SvgNames.cat_10,
  SvgNames.cat_11,
  SvgNames.cat_12,
  SvgNames.cat_13,
  SvgNames.cat_14,
  SvgNames.cat_15,
  SvgNames.cat_16,
  SvgNames.cat_17,
  SvgNames.cat_18,
  SvgNames.cat_19,
  SvgNames.cat_20,
  SvgNames.cat_21,
  SvgNames.cat_22,
  SvgNames.cat_23,
  SvgNames.cat_24,
  SvgNames.cat_25,
  SvgNames.cat_26,
  SvgNames.cat_27,
  SvgNames.cat_28,
];


// names of tests
const titles = [
  '1. Financial Markets and Instruments',
  '2. Financial Analysis and Business Planning',
  '3. Personal Investment Management',
  '4. Financial Decision-Making in Family Life',
  '5. Financial Literacy for Youth and Students',
  '6. Financial Technologies and Digital Platforms',
  '7. Personal Finance Management in Times of Economic Crisis',
  '8. Financial Literacy for Women',
  '9. Financial Literacy for the Elderly',
  '10. Ethics and Responsibility in Financial Decisions',
];

const allQuestions = [
  questions_1,
  questions_2,
  questions_3,
  questions_4,
  questions_5,
  questions_6,
  questions_7,
  questions_8,
  questions_9,
  questions_10,
];

const questions_1 = [
  {
    "question": "What is a stock?",
    "options": [
      "Credit document",
      "Debt instrument",
      "Ownership stake in a company",
      "Currency instrument"
    ],
    "answer": 2
  },
  {
    "question": "What is a bond?",
    "options": [
      "Debt instrument",
      "Currency instrument",
      "Credit document",
      "Ownership stake in a company"
    ],
    "answer": 0
  },
  {
    "question": "What is a derivative?",
    "options": [
      "Instrument for risk hedging",
      "Instrument for capital management",
      "Instrument for attracting investments",
      "Instrument for conducting currency operations"
    ],
    "answer": 0
  },
  {
    "question": "What is an ETF (exchange-traded fund)?",
    "options": [
      "Fund that invests in shares of a single company",
      "Fund that invests in shares of multiple companies",
      "Fund that invests in bonds",
      "Fund that invests in real estate"
    ],
    "answer": 1
  },
  {
    "question": "What is the market price?",
    "options": [
      "Price at which a product or service is sold",
      "Price at which a product or service is bought",
      "Price at which a transaction is made on the financial market",
      "Price at which a company evaluates its assets"
    ],
    "answer": 2
  }
];

const questions_2 = [
  {
    "question": "What is the profitability ratio?",
    "options": [
      "Ratio of net profit to sales revenue",
      "Ratio of assets to liabilities",
      "Ratio of current assets to current liabilities",
      "Ratio of long-term assets to long-term liabilities"
    ],
    "answer": 0
  },
  {
    "question": "What is the liquidity ratio?",
    "options": [
      "Ratio of current assets to current liabilities",
      "Ratio of assets to liabilities",
      "Ratio of net profit to sales revenue",
      "Ratio of long-term assets to long-term liabilities"
    ],
    "answer": 0
  },
  {
    "question": "What is the financial stability ratio?",
    "options": [
      "Ratio of long-term assets to long-term liabilities",
      "Ratio of current assets to current liabilities",
      "Ratio of assets to liabilities",
      "Ratio of net profit to sales revenue"
    ],
    "answer": 0
  },
  {
    "question": "What is the inventory turnover ratio?",
    "options": [
      "Ratio of sales revenue to average inventory",
      "Ratio of net profit to sales revenue",
      "Ratio of current assets to current liabilities",
      "Ratio of assets to liabilities"
    ],
    "answer": 0
  },
  {
    "question": "What is the accounts receivable turnover ratio?",
    "options": [
      "Ratio of sales revenue to average accounts receivable",
      "Ratio of current assets to current liabilities",
      "Ratio of assets to liabilities",
      "Ratio of net profit to sales revenue"
    ],
    "answer": 0
  }
];

const questions_3 = [
  {
    "question": "What is the diversification of an investment portfolio?",
    "options": [
      "Distribution of investments among different assets to reduce risk",
      "Investing only in one type of asset to maximize profit",
      "Selling all assets in the portfolio to minimize losses",
      "Purchasing shares in only one company to gain a share of its profit"
    ],
    "answer": 0
  },
  {
    "question": "What is an investor's risk profile?",
    "options": [
      "Assessment of an investment portfolio based on returns and risk",
      "Investment strategy based on forecasting market trends",
      "Determination of the level of risk an investor is willing to tolerate",
      "Analysis of financial indicators of companies to choose stocks"
    ],
    "answer": 2
  },
  {
    "question": "What are stocks?",
    "options": [
      "Ownership shares in a company, providing the right to a share of profits and participation in management",
      "Bonds issued by a company to raise debt capital",
      "Shares in an investment fund, allowing for returns from investments",
      "Currency pairs used for trading on the forex market"
    ],
    "answer": 0
  },
  {
    "question": "What are bonds?",
    "options": [
      "Ownership shares in a company, providing the right to a share of profits and participation in management",
      "Shares in an investment fund, allowing for returns from investments",
      "Instruments of debt financing issued by a company or government",
      "Currency pairs used for trading on the forex market"
    ],
    "answer": 2
  },
  {
    "question": "What is an investment horizon?",
    "options": [
      "The period for which investment funds are planned",
      "The amount of money an investor is willing to spend on investments",
      "Investment strategy based on forecasting market trends",
      "Assessment of an investment portfolio based on returns and risk"
    ],
    "answer": 0
  }
];

const questions_4 = [
  {
    "question":
        "Which of the following factors is crucial when making financial decisions in a family?",
    "options": [
      "Social obligations",
      "Personal financial goals",
      "Opinions of relatives and friends",
      "Current fashion trends"
    ],
    "answer": 1
  },
  {
    "question":
        "Which of the following behaviors can contribute to a family's financial stability?",
    "options": [
      "Regularly adding to savings",
      "Frequent large spending on entertainment and purchases",
      "Using credit cards to cover ongoing expenses",
      "Not participating in family budget planning"
    ],
    "answer": 0
  },
  {
    "question":
        "Which of the following methods can help a family reduce expenses and manage the budget?",
    "options": [
      "Setting up automatic payments",
      "Buying goods on credit",
      "Purchasing stocks on the stock market",
      "Engaging in long-term financial transactions"
    ],
    "answer": 0
  },
  {
    "question":
        "Which of the following approaches can help a family manage debts?",
    "options": [
      "Regularly adding to savings",
      "Minimizing loan repayments",
      "Using credit cards to cover ongoing expenses",
      "Not paying bills and debts"
    ],
    "answer": 1
  },
  {
    "question":
        "Which of the following factors can help a family achieve financial stability?",
    "options": [
      "Constantly increasing spending on entertainment",
      "Regularly adding to savings",
      "Using credit cards to cover ongoing expenses",
      "Not participating in family budget planning"
    ],
    "answer": 1
  }
];

const questions_5 = [
  {
    "question": "What is a budget?",
    "options": [
      "A list of all purchases that need to be made",
      "The amount of money that can be spent over a specific period",
      "A bank account for storing money",
      "The process of planning and controlling expenses and income"
    ],
    "answer": 3
  },
  {
    "question": "What is a credit history?",
    "options": [
      "A report on debts to banks and other creditors",
      "A list of all credit cards used by the client",
      "Payment history for utility services",
      "The amount of money that can be obtained on credit"
    ],
    "answer": 0
  },
  {
    "question": "What is an interest rate?",
    "options": [
      "The amount of money to be repaid to the bank along with interest",
      "The amount of money the bank pays the client for storing money",
      "The fee for using credit or a loan",
      "The amount of money that can be obtained on credit"
    ],
    "answer": 2
  },
  {
    "question": "What is inflation?",
    "options": [
      "The increase in prices for goods and services over time",
      "The decrease in prices for goods and services over time",
      "Changes in the value of stocks in the stock market",
      "The amount of money that can be obtained on credit"
    ],
    "answer": 0
  },
  {
    "question": "What are investments?",
    "options": [
      "The amount of money to be repaid to the bank along with interest",
      "A way to increase savings by investing in assets",
      "The fee for using credit or a loan",
      "The amount of money that can be obtained on credit"
    ],
    "answer": 1
  }
];

const questions_6 = [
  {
    "question": "What is an electronic wallet?",
    "options": [
      "A device for storing physical cash",
      "Special software for conducting financial transactions online",
      "A bank card that can be used to pay for goods and services",
      "A virtual account for storing and using electronic money"
    ],
    "answer": 3
  },
  {
    "question": "What is cryptocurrency?",
    "options": [
      "Currency used for online financial transactions",
      "Virtual currency based on data encryption",
      "Currency used exclusively in cyberspace",
      "Currency created for anonymous financial transactions"
    ],
    "answer": 1
  },
  {
    "question": "What is blockchain?",
    "options": [
      "A method of encrypting data to secure financial transactions",
      "Technology that allows storing and transmitting information in the form of a chain of blocks",
      "A specific type of cryptocurrency that uses blockchain for transactions",
      "A secure platform for online trading"
    ],
    "answer": 1
  },
  {
    "question": "What is a digital platform?",
    "options": [
      "A website for conducting online transactions",
      "An online service providing access to financial instruments and services",
      "Software for managing finances on a personal computer",
      "A mobile application for paying for goods and services"
    ],
    "answer": 1
  },
  {
    "question": "What is a robo-advisor?",
    "options": [
      "A program that automatically makes decisions about financial investments",
      "A robot that helps manage finances and make payments",
      "A specialized device for conducting financial transactions online",
      "A virtual assistant that provides financial advice"
    ],
    "answer": 0
  }
];

const questions_7 = [
  {
    "question":
        "Which of the following methods can help save money during an economic crisis?",
    "options": [
      "Keep money under the mattress",
      "Invest in high-risk stocks",
      "Regularly save a portion of income into savings",
      "Spend more time shopping"
    ],
    "answer": 2
  },
  {
    "question":
        "What action can help reduce expenses during an economic crisis?",
    "options": [
      "Increase the number of purchases on credit",
      "Reduce spending on entertainment and restaurants",
      "Acquire new expensive items",
      "Not control one's finances"
    ],
    "answer": 1
  },
  {
    "question":
        "Which of the following instruments can help protect savings from inflation during an economic crisis?",
    "options": [
      "Keeping money in cash",
      "Investing in real estate",
      "Opening an account with a bank with high-interest rates",
      "Buying shares of companies operating in stable industries"
    ],
    "answer": 2
  },
  {
    "question":
        "Which approach can help increase income during an economic crisis?",
    "options": [
      "Spend all income on entertainment and purchases",
      "Seek additional sources of income, such as freelancing or part-time jobs",
      "Neglect personal financial planning",
      "Increase the number of credits and loans"
    ],
    "answer": 1
  },
  {
    "question":
        "Which of the following strategies can help reduce risks during an economic crisis?",
    "options": [
      "Invest all savings in one company",
      "Diversify the investment portfolio",
      "Not save money",
      "Spend more time shopping"
    ],
    "answer": 1
  }
];

const questions_8 = [
  {
    "question":
        "Which of the following factors is crucial for achieving financial independence?",
    "options": [
      "Consistent income flow",
      "High level of education",
      "Large inheritance",
      "Lottery luck"
    ],
    "answer": 0
  },
  {
    "question":
        "Which of the following instruments can help in achieving financial goals?",
    "options": [
      "Bank account with high-interest rates",
      "Buying goods on credit",
      "Regularly participating in the lottery",
      "Spending all income on entertainment"
    ],
    "answer": 0
  },
  {
    "question":
        "Which of the following approaches will help reduce expenses and save money?",
    "options": [
      "Regularly saving a portion of income into savings",
      "Buying goods only in expensive stores",
      "Not keeping track of one's budget",
      "Taking loans to buy unnecessary items"
    ],
    "answer": 0
  },
  {
    "question": "Which of the following factors can help increase income?",
    "options": [
      "Investing in stocks of companies",
      "Buying goods on sales",
      "Neglecting personal financial planning",
      "Spending all income on entertainment"
    ],
    "answer": 0
  },
  {
    "question":
        "Which of the following strategies will help protect savings from inflation?",
    "options": [
      "Keeping money in cash",
      "Investing in real estate",
      "Opening an account with a bank with high-interest rates",
      "Spending more time shopping"
    ],
    "answer": 2
  }
];

const questions_9 = [
  {
    "question":
        "Which of the following factors is crucial for maintaining financial stability in old age?",
    "options": [
      "Consistent income flow",
      "Dependence on children",
      "Lottery win",
      "Receiving a pension"
    ],
    "answer": 0
  },
  {
    "question":
        "Which of the following instruments can help preserve and grow savings in old age? (Select two answers)",
    "options": [
      "Bank deposits with high-interest rates",
      "Regular purchases of lottery tickets",
      "Investing in real estate",
      "Spending all income on entertainment"
    ],
    "answer": [0, 2]
  },
  {
    "question":
        "Which of the following approaches will help reduce expenses and increase savings in old age?",
    "options": [
      "Regularly setting aside a portion of the pension for savings",
      "Buying goods only in expensive stores",
      "Not keeping track of one's budget",
      "Taking loans to buy unnecessary items"
    ],
    "answer": 0
  },
  {
    "question":
        "Which of the following factors can help increase income in old age?",
    "options": [
      "Investing in stocks of companies",
      "Buying goods on sales",
      "Neglecting personal financial planning",
      "Spending all income on entertainment"
    ],
    "answer": 0
  },
  {
    "question":
        "Which of the following strategies will help protect savings from inflation in old age?",
    "options": [
      "Keeping money in cash",
      "Investing in real estate",
      "Opening an account with a bank with high-interest rates",
      "Spending more time shopping"
    ],
    "answer": 2
  }
];

const questions_10 = [
  {
    "question":
        "Which of the following principles is the foundation of ethical behavior in financial decisions?",
    "options": [
      "Maximizing profit at any cost",
      "Compliance with laws and regulations",
      "Using internal information for personal gain",
      "Making decisions based on personal preferences"
    ],
    "answer": 1
  },
  {
    "question":
        "Which of the following actions is an example of responsible financial behavior?",
    "options": [
      "Concealing income when filing a tax return",
      "Using someone else's credit card without permission",
      "Regularly contributing to one's own pension account",
      "Engaging in financial manipulations for unlawful profit"
    ],
    "answer": 2
  },
  {
    "question":
        "Which of the following principles helps avoid conflicts of interest in making financial decisions?",
    "options": [
      "Principle of fairness",
      "Profit maximization principle",
      "Egoism principle",
      "Indifference principle"
    ],
    "answer": 0
  },
  {
    "question":
        "Which of the following actions is an example of ethical behavior in financial decisions?",
    "options": [
      "Market manipulation for personal gain",
      "Providing false information about the company's financial position",
      "Refusing to pay salaries to employees",
      "Supporting socially responsible projects"
    ],
    "answer": 3
  },
  {
    "question":
        "Which of the following principles helps avoid conflicts of interest in making financial decisions?",
    "options": [
      "Indifference principle",
      "Egoism principle",
      "Principle of fairness",
      "Profit maximization principle"
    ],
    "answer": 2
  }
];

const texts = [
  text_1,
  text_2,
  text_3,
  text_4,
  text_5,
  text_6,
  text_7,
  text_8,
  text_9,
  text_10,
];

const text_1 = """
Financial markets and instruments play a crucial role in the modern economy. They provide opportunities for investment, risk protection, and ensure liquidity. Financial markets serve as a meeting place for the demand and supply of financial assets such as stocks, bonds, derivatives, and currencies.
One of the main advantages of financial markets is the ability to diversify investments. Investors can allocate their capital among different assets and asset classes to reduce risks and enhance potential returns. Financial markets also contribute to price discovery based on supply and demand, ensuring efficient resource allocation.
Various tools are used on financial markets for trading and risk management. For instance, stocks represent ownership in companies, allowing investors to earn income through dividends and capital gains. Bonds, on the other hand, are debt instruments guaranteeing interest payments and the return of principal at maturity.
Derivatives like futures and options provide opportunities for risk hedging and speculation on asset price changes. They enable investors to fix the price for future asset purchases or sales, particularly valuable in uncertain conditions.
Financial markets also offer avenues for funding companies and governments. Companies can issue stocks and bonds to raise capital for business development, while governments issue bonds to finance projects and sustain governmental functions.
However, despite the benefits, financial markets are susceptible to risks and instability. Financial crises may arise from inadequate risk assessment and insufficient control over financial instruments. Therefore, understanding financial markets and instruments is crucial for making informed decisions and managing risks effectively.
In conclusion, financial markets and instruments play a vital role in the modern economy, offering investment opportunities, risk protection, and liquidity. However, a good understanding of these markets and instruments is necessary for successful utilization, enabling individuals to make informed financial decisions.
""";

const text_2 = """
Financial analysis and business planning are essential tools for successful financial management of a company. They help businesses assess their current financial situation, forecast future results, and make informed financial decisions.
Financial analysis involves evaluating financial indicators and ratios such as profitability, liquidity, return on investment, and asset efficiency. Analysis is based on the company's financial statements, including the balance sheet, income statement, and cash flow statement. This process helps identify the strengths and weaknesses of the company, detect trends and potential issues, and compare results with competitors and industry standards.
Based on the results of financial analysis, a financial plan is developed. This plan includes forecasting revenues, expenses, profits, and cash flows for a specific period. The financial plan helps businesses define their financial goals and strategies, as well as assess the need for additional financing. It also assists in managing resources, planning investments, and forecasting the need for working capital.
Financial analysis and business planning offer several advantages. Firstly, they enable businesses to make informed financial decisions based on objective data and analytical methods. Secondly, they help prevent financial problems and crises by warning about potential risks and issues in advance. Lastly, financial analysis and planning allow businesses to optimize resource usage and achieve maximum efficiency.
However, financial analysis and business planning also have limitations and challenges. They require access to accurate financial data and the ability to interpret it. Additionally, they rely on assumptions and forecasts that may not always be precise. Finally, financial analysis and planning demand time and resources, which can be challenging for small and medium-sized enterprises.
In conclusion, financial analysis and business planning are crucial tools for successful financial management. They assist businesses in evaluating their current financial status, forecasting future results, and making informed financial decisions. However, effective utilization of these tools requires access to accurate financial data, the ability to analyze and forecast, and dedicated time and resources.
""";

const text_3 = """
Personal investment management is a crucial part of financial planning and can significantly impact our financial security and future well-being. It involves making decisions about allocating our financial resources among various assets and instruments to achieve maximum returns and minimize risks.
One of the key aspects of personal investment management is portfolio diversification. Diversification allows the distribution of risks among different assets, such as stocks, bonds, real estate, and others. This helps reduce the likelihood of losses and increases the potential for returns. Additionally, diversification may also include geographic and sectoral diversification to lessen the impact of specific events or changes in particular markets or industries.
Another essential aspect of personal investment management is defining investment goals and timelines. Goals may vary from capital preservation to achieving maximum returns or reaching specific financial objectives, such as buying a home or planning for retirement. Defining timelines is crucial as they can influence the choice of assets and investment strategies. For example, low-risk and liquid instruments may be preferable for short-term goals, while riskier but potentially more profitable assets can be considered for long-term goals.
When managing personal investments, it is essential to consider financial capabilities and risk tolerance. Determining the capacity for loss, i.e., how much one can afford to lose without significant harm to financial stability, helps establish an appropriate risk level and choose suitable investment instruments.
Regular monitoring and portfolio review are also vital aspects of personal investment management. Financial markets constantly change, so it is necessary to keep track of economic conditions, industry trends, and investment performance. Regular portfolio reviews allow adjustments to strategies and informed decisions regarding selling, buying, or rebalancing assets.
In conclusion, personal investment management is a crucial aspect of financial planning. It helps achieve financial goals, minimize risks, and maximize returns. Successful personal investment management requires defining investment goals and timelines, diversifying the portfolio, considering financial capabilities and risk tolerance, and regularly monitoring and reviewing the portfolio.
""";

const text_4 = """
Financial decisions play a crucial role in family life and can significantly impact the financial well-being of the family. These decisions encompass various aspects of life, including budgeting, investing, purchase planning, and debt management.
One of the key aspects of financial decisions in family life is the creation and maintenance of a family budget. A budget helps determine how much money can be allocated to various expense categories, such as food, housing, transportation, entertainment, and others. It aids in controlling expenses, avoiding unnecessary spending, and setting family priorities. Creating a budget together with a partner allows for discussions and agreements on financial goals and family priorities.
Investing is also a critical aspect of financial decisions in family life. Investing enables the accumulation of capital and ensures financial security in the future. It may involve various types of assets, such as stocks, bonds, real estate, and others. When making investment decisions, considering financial capabilities, goals, and risk profiles is crucial. Investing can also become a family project, with partners jointly making decisions on allocating investment resources.
Purchase planning is another important aspect of financial decisions in family life. Purchases can be significant, such as buying a car or a house, or smaller, like groceries or clothing. Planning purchases helps avoid impulsive buying, control expenses, and may involve searching for the best deals, price comparisons, and utilizing discounts and promotions.
Debt management is yet another crucial aspect of financial decisions in family life. Debts may come in the form of loans, mortgages, student loans, and other financial obligations. Managing debts includes planning for debt repayment, controlling interest rates, and minimizing the overall debt burden. It is essential to consider financial capabilities for debt repayment and make informed decisions about loans.
In conclusion, financial decisions play a vital role in family life and can significantly impact the family's financial well-being. These decisions include creating a budget, investing, planning purchases, and managing debts. Making informed financial decisions helps achieve family financial goals, ensure financial security, and improve overall quality of life.
""";

const text_5 = """
Financial decisions play a crucial role in family life and can significantly impact the financial well-being of a family. They encompass various aspects of our lives, including budgeting, investing, planning purchases, and managing debts.
One key aspect of financial decisions in family life is the creation and maintenance of a family budget. A budget helps determine how much money can be allocated to different expense categories such as food, housing, transportation, entertainment, and more. It aids in controlling expenses, avoiding unnecessary spending, and setting priorities. Creating a budget together with a partner allows for discussions and alignment of financial goals and family priorities.
Investing is also a vital component of financial decisions in family life. Investing enables the accumulation of capital and provides financial security for the future. It may involve various assets such as stocks, bonds, real estate, and others. When making investment decisions, it's important to consider financial capabilities, goals, and risk tolerance. Investing can also be a collaborative family project, where partners make decisions together on allocating investment resources.
Planning purchases is another significant aspect of financial decisions within a family. Whether it's a major purchase like a car or a house or smaller ones like groceries or clothing, planning purchases helps avoid impulsive buying and maintain control over expenditures. It may include searching for the best deals, comparing prices, and taking advantage of discounts and promotions.
Effectively managing debts is yet another critical aspect of financial decisions in family life. Debts can take various forms, such as loans, mortgages, student loans, and other financial obligations. Managing debts involves planning for debt repayment, monitoring interest rates, and minimizing the overall debt burden. It's essential to consider one's financial capacity for debt repayment and make informed decisions about borrowing.
In conclusion, financial decisions play a vital role in family life and can significantly influence a family's financial well-being. These decisions encompass creating a budget, investing, planning purchases, and managing debts. Making informed financial decisions helps achieve family financial goals, ensure financial security, and enhance overall quality of life.
""";

const text_6 = """
Financial literacy is a key skill that youth and students must acquire for successful management of their finances. In today's world, where debts, credits, and consumer loans are integral parts of our lives, having an understanding of how to manage finances correctly is crucial.
The first step towards financial literacy is recognizing the importance of financial planning. Youth and students should understand that effective planning and budgeting can help them achieve financial goals and avoid a debt burden. They need to learn to identify their priorities and allocate their income to various expense categories, such as education, housing, food, entertainment, and more.
The second step towards financial literacy is realizing the importance of savings and investments. Youth and students should start saving money in savings accounts or invest in various assets like stocks or real estate. Understanding that early savings and investments can bring significant financial benefits in the future is essential.
The third step towards financial literacy is recognizing the importance of debt management. Youth and students should understand that borrowed funds need to be used responsibly and thoughtfully. They should consider their financial capability to repay debts and avoid unnecessary debt burdens. Additionally, they should be aware of various types of loans and their terms.
The fourth step towards financial literacy is acknowledging the importance of education and self-improvement. Youth and students should strive for continuous learning in the field of finance. Reading books, attending financial seminars, studying financial literature, and staying updated with market trends will help them develop skills in financial planning, investment, and debt management.
In conclusion, financial literacy is a crucial skill for youth and students. It helps them manage their finances effectively, achieve financial goals, and ensure financial security in the future. Recognizing the importance of financial planning, savings and investments, debt management, and continuous education are key steps towards achieving financial literacy.
""";

const text_7 = """
Managing personal finances during an economic crisis is a particularly crucial task that requires awareness, planning, and flexibility. Crisis periods can lead to job loss, income reduction, and market instability, making it necessary to take appropriate measures to ensure financial stability and protection from negative consequences.
The first step in managing personal finances during a crisis is creating a budget. It is essential to identify current income and expenses, as well as prioritize spending. Temporary expense reduction may be necessary to maintain financial stability. This could include giving up some luxuries, cutting expenses on entertainment and dining out, and exploring opportunities to save on daily expenses.
Another important aspect of managing personal finances in crisis times is maintaining an emergency fund. This is a sum of money that can be used for unexpected expenses or in case of job loss. It is recommended to have reserved funds sufficient to cover expenses for several months. This helps avoid financial difficulties in case of income loss.
Developing an investment strategy is also crucial in managing personal finances during a crisis. A crisis may provide opportunities to acquire assets at lower prices. However, investments during a crisis also come with risks, requiring caution and consultation with experts. Diversifying investments and considering long-term perspectives can help reduce risks and achieve financial goals.
Equally important in managing personal finances during a crisis is education and awareness. Staying informed about the current economic situation, analyzing news and forecasts, and seeking advice from financial experts are crucial. Education in financial literacy helps in making informed decisions, managing risks, and taking advantage of opportunities that may arise during a crisis.
In conclusion, managing personal finances during an economic crisis requires awareness, planning, and flexibility. Creating a budget, maintaining an emergency fund, developing an investment strategy, and educating oneself in financial literacy are key elements of successful financial management during a crisis. It is essential to be prepared for changes, make informed decisions, and strive for financial stability and well-being.
""";

const text_8 = """
Financial literacy is an important aspect of everyone's life, including women. In the modern world, women play an increasingly active role in the economy and finance, making the ability to effectively manage their finances a key skill.
Financial literacy for women has several aspects. Firstly, it involves understanding the basic principles of personal financial planning. Women should know how to create a budget, control their expenses, and manage their savings. This enables them to make informed decisions about their finances and achieve their goals.
Secondly, financial literacy for women includes understanding investments and risks. Women should be aware of various types of investments, such as stocks, bonds, and real estate, and be able to assess their potential returns and risks. This helps them make informed decisions about their investments and build financial security for the future.
The third aspect of financial literacy for women is understanding credit and debt. Women should know how to manage their credits, optimize their expenses, and minimize their debts. This helps them avoid financial problems and build a credit history that contributes to obtaining better credit terms in the future.
Finally, financial literacy for women also includes understanding pension planning and insurance. Women should be familiar with various types of pension accounts and insurance policies to ensure their financial security in retirement and protect themselves and their families from unforeseen events.
Financial literacy for women is essential not only for individual well-being but also for society as a whole. Women with financial literacy can make more informed decisions about their finances, build a stable future for themselves and their families, and contribute to economic development and prosperity.
In conclusion, financial literacy for women is an integral part of their success and well-being. Understanding the basic principles of financial planning, investments, credit, and pension planning helps women make informed decisions about their finances and achieve their goals. Education and awareness in financial literacy are key factors in achieving financial independence and success in the modern world.
""";

const text_9 = """
Financial literacy is an important aspect of everyone's life, including seniors. In the modern world, where inflation rates are rising, the cost of medical services and goods is increasing, and pension payments are limited, it is especially important for seniors to possess financial literacy.
Firstly, seniors should know how to effectively manage their finances and plan for their future. This includes creating a budget, controlling expenses, and managing savings. Seniors need to be aware of their incomes and expenses to plan their finances for the long term.
Secondly, financial literacy for seniors also involves understanding investments and risks. Seniors should be familiar with various types of investments, such as stocks, bonds, and real estate, and be able to assess their potential returns and risks. This helps them make informed decisions about their investments and build financial security for the future.
The third aspect of financial literacy for seniors is understanding pension planning and insurance. Seniors should know about different types of pension accounts, pension distribution rules, and options for additional insurance. This helps them ensure their financial security in retirement and protect themselves from unforeseen events.
Finally, financial literacy for seniors also includes understanding taxation and legal aspects of financial transactions. Seniors should be aware of tax benefits that may be available to them and understand their rights and responsibilities in financial matters.
Financial literacy for seniors is crucial for their well-being and quality of life. Seniors with financial literacy can make informed decisions about their finances, build a stable future for themselves, and ensure their financial security. Education and awareness in financial literacy are key factors in achieving financial independence and success in the modern world, especially for seniors.
""";

const text_10 = """
Ethics and responsibility play a crucial role in all aspects of our lives, including financial decisions. In the modern world, where money holds significant importance and financial transactions are becoming increasingly complex, it is essential to uphold high moral principles and make responsible decisions.
Firstly, ethics in financial decisions entail honesty and fairness. People should be truthful in their financial transactions, avoiding deceit towards others or organizations. They must adhere to laws and regulations related to finances and refrain from abusing their position or access to information. This is crucial for maintaining trust in the financial system and protecting the interests of all participants.
Secondly, responsibility in financial decisions means being aware of the consequences of one's actions. Individuals should understand that their financial decisions can have long-term repercussions for themselves and others. They should consider not only their own interests but also the societal and environmental aspects. For instance, when making decisions about investments or consumer behavior, they should take into account the social and environmental consequences of their actions.
The third aspect of ethics and responsibility in financial decisions is showing respect for others. People should consider the interests and needs of others, especially those in more vulnerable positions. For example, they should pay special attention to their clients, investors, or partners and refrain from exploiting their lack of knowledge or weaknesses for personal gain. They should strive to create mutually beneficial relationships and fairness in all financial transactions.
In conclusion, ethics and responsibility play a vital role in financial decisions. Honesty, fairness, awareness, and respect for others are fundamental principles in the financial world. Adhering to these principles helps maintain trust in the financial system, protect the interests of all participants, and contribute to building a sustainable and just society.
 """;

// const titles = [
//   '1. Budgeting and expenditure planning',
//   '2. Debt and credit management',
//   '3. Investments and financial instruments',
//   '4. Tax planning and optimization',
//   '5. Financial literacy for entrepreneurs',
//   '6. Basics of personal finance and income management',
//   '7. Insurance and protection against financial risks',
//   '8. Retirement planning and future savings',
//   '9. Financial strategies for achieving financial independence',
//   '10. Financial decisions when purchasing real estate or a car',
// ];

// const questions_1 = [
//   {
//     "question":
//         "Which of the following is NOT important in budgeting and expense planning?",
//     "options": [
//       "Determining financial goals",
//       "Assessing current expenses",
//       "Increasing the credit limit on a credit card",
//       "Creating an emergency fund"
//     ],
//     "answer": 2
//   },
//   {
//     "question":
//         "Which approach is best for controlling expenses and sticking to a budget?",
//     "options": [
//       "Buying things on emotions",
//       "Setting long-term financial goals",
//       "Saving money before making a purchase",
//       "Relying on credit cards"
//     ],
//     "answer": 2
//   },
//   {
//     "question": "What should you do if unexpected expenses arise?",
//     "options": [
//       "Use a credit card for payment",
//       "Spend all savings",
//       "Seek help from family or friends",
//       "Use the emergency fund"
//     ],
//     "answer": 3
//   },
//   {
//     "question": "Which of the following helps reduce food expenses?",
//     "options": [
//       "Buying ready-made food at a restaurant",
//       "Cooking at home",
//       "Buying high-quality groceries",
//       "Purchasing groceries on promotions and discounts"
//     ],
//     "answer": 3
//   },
//   {
//     "question": "What will help reduce entertainment expenses?",
//     "options": [
//       "Visiting expensive restaurants and clubs",
//       "Abandoning all entertainment",
//       "Finding free or inexpensive entertainment",
//       "Buying new games and entertainment"
//     ],
//     "answer": 2
//   }
// ];
//
// const questions_2 = [
//   {
//     "question": "Which of the following is NOT a debt management method?",
//     "options": [
//       "Regular loan payments",
//       "Debt consolidation",
//       "Opening new credit cards",
//       "Creating a debt repayment plan"
//     ],
//     "answer": 2
//   },
//   {
//     "question": "Which of the following will help reduce the debt burden?",
//     "options": [
//       "Increasing the credit card limit",
//       "Continuing to use credit cards for purchases",
//       "Repaying debts with the highest interest rate first",
//       "Depending on loans and credits"
//     ],
//     "answer": 2
//   },
//   {
//     "question": "Which of the following is a sign of improper debt management?",
//     "options": [
//       "Paying the minimum amount on credit cards",
//       "Regular payments on loans and debts",
//       "Constantly increasing debt on credit cards",
//       "Creating an emergency fund for unforeseen expenses"
//     ],
//     "answer": 2
//   },
//   {
//     "question": "What should you do if you can't repay your debts on time?",
//     "options": [
//       "Continue using credit cards",
//       "Seek help from financial counseling specialists",
//       "Take out a new loan to repay old debts",
//       "Use the emergency fund to repay debts"
//     ],
//     "answer": 1
//   },
//   {
//     "question":
//         "Which of the following will help prevent the accumulation of new debts?",
//     "options": [
//       "Increasing the credit card limit",
//       "Regularly tracking and controlling expenses",
//       "Relying on loans and credits",
//       "Opening new credit accounts"
//     ],
//     "answer": 1
//   }
// ];
//
// const questions_3 = [
//   {
//     "question": "What is a stock?",
//     "options": [
//       "Debt instrument",
//       "Currency instrument",
//       "Financial instrument representing ownership stake in a company",
//       "Instrument for storing securities"
//     ],
//     "answer": 2
//   },
//   {
//     "question": "What is a bond?",
//     "options": [
//       "Instrument for storing securities",
//       "Financial instrument representing ownership stake in a company",
//       "Debt instrument representing a loan amount",
//       "Currency instrument"
//     ],
//     "answer": 2
//   },
//   {
//     "question": "What is an ETF (Exchange Traded Fund)?",
//     "options": [
//       "Index fund",
//       "Currency instrument",
//       "Fund traded on the exchange that tracks a specific index or sector",
//       "Instrument for storing securities"
//     ],
//     "answer": 2
//   },
//   {
//     "question": "What are dividends?",
//     "options": [
//       "Profit obtained from selling stocks",
//       "Income obtained from renting real estate",
//       "Payments received by shareholders from the company in the form of cash or additional shares",
//       "Income obtained from a bank deposit"
//     ],
//     "answer": 2
//   },
//   {
//     "question": "What is an investment portfolio?",
//     "options": [
//       "Amount of money invested in a single financial instrument",
//       "Amount of money invested in several different financial instruments",
//       "Total value of assets owned by an investor",
//       "Income obtained from renting real estate"
//     ],
//     "answer": 1
//   }
// ];
//
// const questions_4 = [
//   {
//     "question":
//         "Which of the following actions is an example of legal tax planning?",
//     "options": [
//       "Concealing income from taxation",
//       "Using tax incentives and deductions provided by law",
//       "Forgery of documents to reduce the tax base",
//       "Opening offshore accounts to evade taxes"
//     ],
//     "answer": 1
//   },
//   {
//     "question": "What is tax optimization?",
//     "options": [
//       "The process of minimizing tax payments by using various legal strategies and methods",
//       "Illegal actions to evade taxes",
//       "The process of maximizing tax payments by using all available tax rates",
//       "The process of forging documents to reduce the tax base"
//     ],
//     "answer": 0
//   },
//   {
//     "question":
//         "Which of the following actions can be included in tax planning and optimization?",
//     "options": [
//       "Distributing income and assets among different legal entities",
//       "Forgery of documents to reduce the tax base",
//       "Using tax incentives and deductions provided by law",
//       "Opening offshore accounts to evade taxes"
//     ],
//     "answer": [0, 2]
//   },
//   {
//     "question":
//         "Which of the following actions is an example of illegal tax evasion?",
//     "options": [
//       "Using tax incentives and deductions provided by law",
//       "Forgery of documents to reduce the tax base",
//       "Distributing income and assets among different legal entities",
//       "Opening offshore accounts for legal fund storage"
//     ],
//     "answer": 1
//   },
//   {
//     "question":
//         "Which of the following factors can influence the effectiveness of tax planning and optimization?",
//     "options": [
//       "Tax legislation and its changes",
//       "Size of income and assets",
//       "Country of company registration",
//       "Age of the individual entrepreneur"
//     ],
//     "answer": [0, 1, 2]
//   }
// ];
//
// const questions_5 = [
//   {
//     "question": "What is accounting?",
//     "options": [
//       "The process of managing a company's finances",
//       "A system for recording and reporting on the financial activities of a company",
//       "A type of activity related to trading financial instruments",
//       "Methodology for developing financial strategies"
//     ],
//     "answer": 1
//   },
//   {
//     "question": "What is a business plan?",
//     "options": [
//       "A document describing the strategy and development plans of a company",
//       "Financial statement form reporting a company's financial position",
//       "A specific type of tax deduction for entrepreneurs",
//       "Methodology for assessing the financial stability of a company"
//     ],
//     "answer": 0
//   },
//   {
//     "question": "What are working capital?",
//     "options": [
//       "Long-term assets of a company",
//       "Financial reserves of a company",
//       "Cash used for the ongoing operations of a company",
//       "Company's capital structure"
//     ],
//     "answer": 2
//   },
//   {
//     "question": "What is net profit?",
//     "options": [
//       "The difference between a company's revenue and expenses",
//       "The amount of tax payments made by a company",
//       "Income generated from selling a company's assets",
//       "Total value of a company's assets"
//     ],
//     "answer": 0
//   },
//   {
//     "question": "What are investments?",
//     "options": [
//       "Long-term obligations of a company",
//       "Cash invested in stocks and securities",
//       "Costs for advertising and marketing",
//       "Revenue from the sale of goods and services"
//     ],
//     "answer": 1
//   }
// ];
//
// const questions_6 = [
//   {
//     "question":
//         "Which of the following factors is essential in personal finance management?",
//     "options": [
//       "Age",
//       "Knowledge of financial instruments",
//       "Salary size",
//       "Hair color"
//     ],
//     "answer": 1
//   },
//   {
//     "question": "What is a budget?",
//     "options": [
//       "A list of monthly purchases",
//       "A plan of expenses and income for a specific period",
//       "A bank account",
//       "The amount of money that can be spent on entertainment"
//     ],
//     "answer": 1
//   },
//   {
//     "question": "Which of the following methods can help save money?",
//     "options": [
//       "Buying items on sale",
//       "Playing the lottery",
//       "Purchasing items on credit",
//       "Celebrating holidays in restaurants"
//     ],
//     "answer": 0
//   },
//   {
//     "question": "What is an interest rate?",
//     "options": [
//       "The amount of money to be repaid on a loan",
//       "The portion of income that can be saved",
//       "The cost of using credit funds",
//       "The amount of money that can be spent on entertainment"
//     ],
//     "answer": 2
//   },
//   {
//     "question":
//         "Which of the following is a fundamental principle of investing?",
//     "options": [
//       "Risking all savings",
//       "Allocating investments among different assets",
//       "Investing money only in one company",
//       "Spending all income on consumption"
//     ],
//     "answer": 1
//   }
// ];
//
// const questions_7 = [
//   {
//     "question": "What is insurance?",
//     "options": [
//       "The process of protecting against financial risks",
//       "The process of earning additional income",
//       "The process of investing money",
//       "The process of buying goods and services"
//     ],
//     "answer": 0
//   },
//   {
//     "question": "What types of insurance exist?",
//     "options": [
//       "Life, health, and property",
//       "Automobile, travel, and sports",
//       "Credit, investment, and pension",
//       "Fire, water, and explosion"
//     ],
//     "answer": 0
//   },
//   {
//     "question": "What is an insurance policy?",
//     "options": [
//       "A document confirming the conclusion of an insurance contract",
//       "A document confirming the purchase of a product",
//       "A document confirming the receipt of a loan",
//       "A document confirming a transaction on the stock exchange"
//     ],
//     "answer": 0
//   },
//   {
//     "question": "What is the premium on an insurance policy?",
//     "options": [
//       "The amount of money the policyholder must pay for insurance",
//       "The amount of money the insurance company must pay in case of an insured event",
//       "The amount of money that can be received when selling an insurance policy",
//       "The amount of money that can be earned by investing in an insurance company"
//     ],
//     "answer": 0
//   },
//   {
//     "question": "What is an insurance event?",
//     "options": [
//       "An event specified in the insurance contract that results in a loss",
//       "An event related to receiving an inheritance",
//       "An event where the policyholder wins the lottery",
//       "An event where the policyholder sells the insurance policy"
//     ],
//     "answer": 0
//   }
// ];
//
// const questions_8 = [
//   {
//     "question":
//         "What concept describes the process of accumulating funds for future retirement?",
//     "options": [
//       "Retirement planning",
//       "Real estate investment",
//       "Inheritance receipt",
//       "Purchase of company stocks"
//     ],
//     "answer": 0
//   },
//   {
//     "question":
//         "Which of the following methods is one of the ways to save for retirement?",
//     "options": [
//       "Saving money in a bank",
//       "Buying a car",
//       "Traveling around the world",
//       "Purchasing expensive goods"
//     ],
//     "answer": 0
//   },
//   {
//     "question": "What is a pension fund?",
//     "options": [
//       "An organization that manages retirees' money",
//       "The place where retirees receive their pensions",
//       "A special account where money is set aside for future retirement",
//       "A government program that provides pensions"
//     ],
//     "answer": 2
//   },
//   {
//     "question":
//         "What factors should be considered when planning for retirement?",
//     "options": [
//       "Age, income, and expenses",
//       "Gender and nationality",
//       "Education and profession",
//       "Hair color and height"
//     ],
//     "answer": 0
//   },
//   {
//     "question":
//         "Which of the following options is one of the investment methods for retirement savings?",
//     "options": [
//       "Buying precious stones",
//       "Gambling in a casino",
//       "Purchasing shares of various companies",
//       "Spending all earned money"
//     ],
//     "answer": 2
//   }
// ];
//
// const questions_9 = [
//   {
//     "question":
//         "Which of the following factors is crucial for achieving financial independence?",
//     "options": [
//       "High income level",
//       "Inheritance from wealthy relatives",
//       "Effective expense management",
//       "Successful investments"
//     ],
//     "answer": 2
//   },
//   {
//     "question":
//         "Which of the following approaches is a strategy for achieving financial independence?",
//     "options": [
//       "Living on credit",
//       "Constantly spending all earned money",
//       "Setting aside a portion of income for investments",
//       "Working multiple jobs simultaneously"
//     ],
//     "answer": 2
//   },
//   {
//     "question":
//         "Which of the following strategies will help achieve financial independence?",
//     "options": [
//       "Regularly replenishing a savings account",
//       "Purchasing goods on credit",
//       "Spending all earned money",
//       "Playing the lottery"
//     ],
//     "answer": 0
//   },
//   {
//     "question":
//         "Which of the following statements is correct regarding investing for financial independence?",
//     "options": [
//       "Investing the entire income in one company",
//       "Diversifying investments into various assets",
//       "Not investing at all to preserve money",
//       "Investing only in real estate"
//     ],
//     "answer": 1
//   },
//   {
//     "question":
//         "Which of the following factors is important for the successful implementation of financial strategies for achieving financial independence?",
//     "options": [
//       "Stable income",
//       "Luck",
//       "High level of education",
//       "Having wealthy relatives"
//     ],
//     "answer": 0
//   }
// ];
//
// const questions_10 = [
//   {
//     "question":
//         "Which of the following factors is crucial when choosing real estate or a car?",
//     "options": [
//       "Color and design",
//       "Location and accessibility",
//       "Brand and model",
//       "Price and financial capabilities"
//     ],
//     "answer": 1
//   },
//   {
//     "question":
//         "Which of the following factors is important when making a financial decision to purchase real estate or a car?",
//     "options": [
//       "Popularity and prestige",
//       "Size and area",
//       "Condition and quality",
//       "Cost and financing options"
//     ],
//     "answer": 3
//   },
//   {
//     "question":
//         "What factors should be considered when purchasing real estate or a car?",
//     "options": [
//       "Monthly maintenance costs",
//       "Duration of the warranty period",
//       "Availability of additional options and features",
//       "History and reputation of the manufacturer or developer"
//     ],
//     "answer": 0
//   },
//   {
//     "question":
//         "Which of the following financing approaches for the purchase of real estate or a car is the most reasonable?",
//     "options": [
//       "Full financing through a loan",
//       "Using savings to pay the full cost",
//       "Combination of own funds and a loan",
//       "Borrowing from friends or relatives"
//     ],
//     "answer": 2
//   },
//   {
//     "question":
//         "What factor is important when choosing a credit offer for the purchase of real estate or a car?",
//     "options": [
//       "Presence of interest-free period",
//       "Low interest rate",
//       "Large loan amount",
//       "Extended repayment period"
//     ],
//     "answer": 1
//   }
// ];
