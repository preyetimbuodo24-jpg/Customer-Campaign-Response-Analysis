SELECT *
FROM marketing_campaign;
SELECT COUNT (*) AS total_customers
FROM marketing_campaign;
SELECT AVG(Income) AS avg_income
FROM marketing_campaign;

SELECT 'Wine' AS Product, AVG(MntWines) AS AvgSpend
FROM marketing_campaign

UNION ALL

SELECT 'Fruits', AVG(MntFruits)
FROM marketing_campaign

UNION ALL

SELECT 'Meat', AVG(MntMeatProducts)
FROM marketing_campaign

UNION ALL

SELECT 'Fish', AVG(MntFishProducts)
FROM marketing_campaign

UNION ALL

SELECT 'Sweets', AVG(MntSweetProducts)
FROM marketing_campaign

UNION ALL

SELECT 'Gold', AVG(MntGoldProds)
FROM marketing_campaign
ORDER BY AvgSpend DESC;

SELECT 'Campaign1' AS Campaign, COUNT(AcceptedCmp1) AS Campaign_sucess
FROM marketing_campaign
WHERE AcceptedCmp1 = 1

UNION ALL

SELECT 'Campaign2', COUNT(AcceptedCmp2) 
FROM marketing_campaign
WHERE AcceptedCmp2 = 1

UNION ALL

SELECT 'Campaign3', COUNT(AcceptedCmp3) 
FROM marketing_campaign
WHERE AcceptedCmp3 = 1

UNION ALL

SELECT 'Campaign4', COUNT(AcceptedCmp4) 
FROM marketing_campaign
WHERE AcceptedCmp4 = 1

UNION ALL

SELECT 'Campaign5', COUNT(AcceptedCmp5) 
FROM marketing_campaign
WHERE AcceptedCmp5 = 1

UNION ALL

SELECT 'Last_cmpgn', COUNT(Response) 
FROM marketing_campaign
WHERE Response = 1;

SELECT
    *,

    (
        CAST(AcceptedCmp1 AS INT) +
        CAST(AcceptedCmp2 AS INT) +
        CAST(AcceptedCmp3 AS INT) +
        CAST(AcceptedCmp4 AS INT) +
        CAST(AcceptedCmp5 AS INT) +
        CAST(Response AS INT)
    ) AS TotalAccepted

FROM marketing_campaign;

SELECT
    CASE
        WHEN Kidhome + Teenhome > 0 THEN 'Has Children'
        ELSE 'No Children'
    END AS FamilyType,

    CAST(AVG(TotalAccepted) AS DECIMAL(10,2)) AS AvgCampaignAccepted

FROM
(
    SELECT
        Kidhome,
        Teenhome,

        (
            CAST(AcceptedCmp1 AS INT) +
            CAST(AcceptedCmp2 AS INT) +
            CAST(AcceptedCmp3 AS INT) +
            CAST(AcceptedCmp4 AS INT) +
            CAST(AcceptedCmp5 AS INT) +
            CAST(Response AS INT)
        ) AS TotalAccepted

    FROM marketing_campaign

) AS CampaignData

GROUP BY
    CASE
        WHEN Kidhome + Teenhome > 0 THEN 'Has Children'
        ELSE 'No Children'
    END

ORDER BY AvgCampaignAccepted DESC;

SELECT
    CASE
        WHEN Kidhome + Teenhome > 0 THEN 'Has Children'
        ELSE 'No Children'
    END AS FamilyType,

    COUNT(*) AS TotalCustomers,

    SUM(
        CASE
            WHEN TotalAccepted > 0 THEN 1
            ELSE 0
        END
    ) AS Responders,

    CAST(
        100.0 *
        SUM(
            CASE
                WHEN TotalAccepted > 0 THEN 1
                ELSE 0
            END
        ) / COUNT(*)
    AS DECIMAL(5,2)) AS ResponseRate

FROM
(
    SELECT
        Kidhome,
        Teenhome,

        (
            CAST(AcceptedCmp1 AS INT) +
            CAST(AcceptedCmp2 AS INT) +
            CAST(AcceptedCmp3 AS INT) +
            CAST(AcceptedCmp4 AS INT) +
            CAST(AcceptedCmp5 AS INT) +
            CAST(Response AS INT)
        ) AS TotalAccepted

    FROM marketing_campaign

) AS CampaignData

GROUP BY
    CASE
        WHEN Kidhome + Teenhome > 0 THEN 'Has Children'
        ELSE 'No Children'
    END; 

    SELECT

    CASE
        WHEN 2024 - Year_Birth < 30 THEN 'Under 30'
        WHEN 2024 - Year_Birth BETWEEN 30 AND 45 THEN '30-45'
        WHEN 2024 - Year_Birth BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS AgeGroup,

    COUNT(*) AS TotalCustomers,

    SUM(
        CASE
            WHEN TotalAccepted > 0 THEN 1
            ELSE 0
        END
    ) AS Responders,

    CAST
    (
        100.0 *
        SUM
        (
            CASE
                WHEN TotalAccepted > 0 THEN 1
                ELSE 0
            END
        )
        / COUNT(*)

    AS DECIMAL(5,2)

    ) AS ResponseRate

FROM
(
    SELECT
        Year_Birth,

        (
            CAST(AcceptedCmp1 AS INT) +
            CAST(AcceptedCmp2 AS INT) +
            CAST(AcceptedCmp3 AS INT) +
            CAST(AcceptedCmp4 AS INT) +
            CAST(AcceptedCmp5 AS INT) +
            CAST(Response AS INT)
        ) AS TotalAccepted

    FROM marketing_campaign

) AS CampaignData

GROUP BY

    CASE
        WHEN 2024 - Year_Birth < 30 THEN 'Under 30'
        WHEN 2024 - Year_Birth BETWEEN 30 AND 45 THEN '30-45'
        WHEN 2024 - Year_Birth BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END

ORDER BY ResponseRate DESC;


SELECT

    CASE
        WHEN NumWebPurchases > NumStorePurchases
             AND NumWebPurchases > NumCatalogPurchases
        THEN 'Web Shopper'

        WHEN NumStorePurchases > NumWebPurchases
             AND NumStorePurchases > NumCatalogPurchases
        THEN 'Store Shopper'

        ELSE 'Catalog Shopper'
    END AS ShopperType,

    COUNT(*) AS TotalCustomers,

    SUM(
        CASE
            WHEN TotalAccepted > 0 THEN 1
            ELSE 0
        END
    ) AS Responders,

    CAST
    (
        100.0 *
        SUM
        (
            CASE
                WHEN TotalAccepted > 0 THEN 1
                ELSE 0
            END
        )
        / COUNT(*)

    AS DECIMAL(5,2)

    ) AS ResponseRate

FROM
(
    SELECT
        NumWebPurchases,
        NumStorePurchases,
        NumCatalogPurchases,

        (
            CAST(AcceptedCmp1 AS INT) +
            CAST(AcceptedCmp2 AS INT) +
            CAST(AcceptedCmp3 AS INT) +
            CAST(AcceptedCmp4 AS INT) +
            CAST(AcceptedCmp5 AS INT) +
            CAST(Response AS INT)
        ) AS TotalAccepted

    FROM marketing_campaign

) AS CampaignData

GROUP BY

    CASE
        WHEN NumWebPurchases > NumStorePurchases
             AND NumWebPurchases > NumCatalogPurchases
        THEN 'Web Shopper'

        WHEN NumStorePurchases > NumWebPurchases
             AND NumStorePurchases > NumCatalogPurchases
        THEN 'Store Shopper'

        ELSE 'Catalog Shopper'
    END

ORDER BY ResponseRate DESC;

SELECT

    YEAR(CONVERT(date, Dt_Customer, 103)) AS EnrollmentYear,

    COUNT(*) AS TotalCustomers,

    SUM
    (
        CASE
            WHEN TotalAccepted > 0 THEN 1
            ELSE 0
        END
    ) AS Responders,

    CAST
    (
        100.0 *
        SUM
        (
            CASE
                WHEN TotalAccepted > 0 THEN 1
                ELSE 0
            END
        )
        / COUNT(*)

    AS DECIMAL(5,2)

    ) AS ResponseRate

FROM
(
    SELECT
        Dt_Customer,

        (
            CAST(AcceptedCmp1 AS INT) +
            CAST(AcceptedCmp2 AS INT) +
            CAST(AcceptedCmp3 AS INT) +
            CAST(AcceptedCmp4 AS INT) +
            CAST(AcceptedCmp5 AS INT) +
            CAST(Response AS INT)
        ) AS TotalAccepted

    FROM marketing_campaign

) AS CampaignData

GROUP BY
    YEAR(CONVERT(date, Dt_Customer, 103))

ORDER BY EnrollmentYear;

SELECT

    'Campaign 1' AS Campaign,
    COUNT(*) AS TotalCustomers,
    SUM(CAST(AcceptedCmp1 AS INT)) AS Responders,

    CAST
    (
        100.0 * SUM(CAST(AcceptedCmp1 AS INT)) / COUNT(*)
    AS DECIMAL(5,2)

    ) AS ResponseRate

FROM marketing_campaign

UNION ALL

SELECT

    'Campaign 2',
    COUNT(*),
    SUM(CAST(AcceptedCmp2 AS INT)),

    CAST
    (
        100.0 * SUM(CAST(AcceptedCmp2 AS INT)) / COUNT(*)
    AS DECIMAL(5,2)

    )

FROM marketing_campaign

UNION ALL

SELECT

    'Campaign 3',
    COUNT(*),
    SUM(CAST(AcceptedCmp3 AS INT)),

    CAST
    (
        100.0 * SUM(CAST(AcceptedCmp3 AS INT)) / COUNT(*)
    AS DECIMAL(5,2)

    )

FROM marketing_campaign

UNION ALL

SELECT

    'Campaign 4',
    COUNT(*),
    SUM(CAST(AcceptedCmp4 AS INT)),

    CAST
    (
        100.0 * SUM(CAST(AcceptedCmp4 AS INT)) / COUNT(*)
    AS DECIMAL(5,2)

    )

FROM marketing_campaign

UNION ALL

SELECT

    'Campaign 5',
    COUNT(*),
    SUM(CAST(AcceptedCmp5 AS INT)),

    CAST
    (
        100.0 * SUM(CAST(AcceptedCmp5 AS INT)) / COUNT(*)
    AS DECIMAL(5,2)

    )

FROM marketing_campaign

UNION ALL

SELECT

    'Latest Campaign',
    COUNT(*),
    SUM(CAST(Response AS INT)),

    CAST
    (
        100.0 * SUM(CAST(Response AS INT)) / COUNT(*)
    AS DECIMAL(5,2)

    )

FROM marketing_campaign

ORDER BY ResponseRate DESC;

SELECT AVG(NumWebVisitsMonth) AS avgmonthlywebvists
FROM marketing_campaign;
SELECT AVG(Recency) AS avgdaysincelastpurchase
FROM marketing_campaign;


SELECT

    CASE
        WHEN NumWebVisitsMonth < 5
        THEN 'Barely visits'

        WHEN NumWebVisitsMonth < 11
        THEN 'Occasional visitor'

        WHEN NumWebVisitsMonth < 15
        THEN 'Frequent visitor'

        ELSE 'Always visits'
    END AS WebVisitor,

    COUNT(*) AS TotalCustomers,

    SUM(
        CASE
            WHEN TotalAccepted > 0 THEN 1
            ELSE 0
        END
    ) AS Responders,

    CAST
    (
        100.0 *
        SUM
        (
            CASE
                WHEN TotalAccepted > 0 THEN 1
                ELSE 0
            END
        )
        / COUNT(*)

    AS DECIMAL(5,2)

    ) AS ResponseRate

FROM
(
    SELECT
        NumWebVisitsMonth,

        (
            CAST(AcceptedCmp1 AS INT) +
            CAST(AcceptedCmp2 AS INT) +
            CAST(AcceptedCmp3 AS INT) +
            CAST(AcceptedCmp4 AS INT) +
            CAST(AcceptedCmp5 AS INT) +
            CAST(Response AS INT)
        ) AS TotalAccepted

    FROM marketing_campaign

) AS CampaignData

GROUP BY

    CASE
        WHEN NumWebVisitsMonth < 5
        THEN 'Barely visits'

        WHEN NumWebVisitsMonth < 11
        THEN 'Occasional visitor'

        WHEN NumWebVisitsMonth < 15
        THEN 'Frequent visitor'

        ELSE 'Always visits'
    END

ORDER BY ResponseRate DESC;
