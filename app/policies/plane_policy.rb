class PlanePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

def create?
  true
end

def show?
  true
end

def edit?
  record.user == user  || user.admin
end

def update?
  record.user == user  || user.admin
end

def destroy?
  if user
    record.user == user || user.admin
  end
end
end
