package com.huayin.coms.model;

import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class CustomerExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CustomerExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andUguid1IsNull() {
            addCriterion("uGuid1 is null");
            return (Criteria) this;
        }

        public Criteria andUguid1IsNotNull() {
            addCriterion("uGuid1 is not null");
            return (Criteria) this;
        }

        public Criteria andUguid1EqualTo(String value) {
            addCriterion("uGuid1 =", value, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1NotEqualTo(String value) {
            addCriterion("uGuid1 <>", value, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1GreaterThan(String value) {
            addCriterion("uGuid1 >", value, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1GreaterThanOrEqualTo(String value) {
            addCriterion("uGuid1 >=", value, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1LessThan(String value) {
            addCriterion("uGuid1 <", value, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1LessThanOrEqualTo(String value) {
            addCriterion("uGuid1 <=", value, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1Like(String value) {
            addCriterion("uGuid1 like", value, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1NotLike(String value) {
            addCriterion("uGuid1 not like", value, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1In(List<String> values) {
            addCriterion("uGuid1 in", values, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1NotIn(List<String> values) {
            addCriterion("uGuid1 not in", values, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1Between(String value1, String value2) {
            addCriterion("uGuid1 between", value1, value2, "uguid1");
            return (Criteria) this;
        }

        public Criteria andUguid1NotBetween(String value1, String value2) {
            addCriterion("uGuid1 not between", value1, value2, "uguid1");
            return (Criteria) this;
        }

        public Criteria andScodeIsNull() {
            addCriterion("sCode is null");
            return (Criteria) this;
        }

        public Criteria andScodeIsNotNull() {
            addCriterion("sCode is not null");
            return (Criteria) this;
        }

        public Criteria andScodeEqualTo(String value) {
            addCriterion("sCode =", value, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeNotEqualTo(String value) {
            addCriterion("sCode <>", value, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeGreaterThan(String value) {
            addCriterion("sCode >", value, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeGreaterThanOrEqualTo(String value) {
            addCriterion("sCode >=", value, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeLessThan(String value) {
            addCriterion("sCode <", value, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeLessThanOrEqualTo(String value) {
            addCriterion("sCode <=", value, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeLike(String value) {
            addCriterion("sCode like", value, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeNotLike(String value) {
            addCriterion("sCode not like", value, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeIn(List<String> values) {
            addCriterion("sCode in", values, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeNotIn(List<String> values) {
            addCriterion("sCode not in", values, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeBetween(String value1, String value2) {
            addCriterion("sCode between", value1, value2, "scode");
            return (Criteria) this;
        }

        public Criteria andScodeNotBetween(String value1, String value2) {
            addCriterion("sCode not between", value1, value2, "scode");
            return (Criteria) this;
        }

        public Criteria andSnameIsNull() {
            addCriterion("sName is null");
            return (Criteria) this;
        }

        public Criteria andSnameIsNotNull() {
            addCriterion("sName is not null");
            return (Criteria) this;
        }

        public Criteria andSnameEqualTo(String value) {
            addCriterion("sName =", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotEqualTo(String value) {
            addCriterion("sName <>", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameGreaterThan(String value) {
            addCriterion("sName >", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameGreaterThanOrEqualTo(String value) {
            addCriterion("sName >=", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameLessThan(String value) {
            addCriterion("sName <", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameLessThanOrEqualTo(String value) {
            addCriterion("sName <=", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameLike(String value) {
            addCriterion("sName like", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotLike(String value) {
            addCriterion("sName not like", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameIn(List<String> values) {
            addCriterion("sName in", values, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotIn(List<String> values) {
            addCriterion("sName not in", values, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameBetween(String value1, String value2) {
            addCriterion("sName between", value1, value2, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotBetween(String value1, String value2) {
            addCriterion("sName not between", value1, value2, "sname");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}